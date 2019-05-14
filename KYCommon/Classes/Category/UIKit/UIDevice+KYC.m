//
//  UIDevice+KYC.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UIDevice+KYC.h"
#import <Reachability/Reachability.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <mach/mach.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <FCUUID/FCUUID.h>
@implementation UIDevice (KYC)

+ (NSString *)carrierName
{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    return [carrier carrierName];
}
+ (KYCNetworkType)getNetType
{
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    KYCNetworkType net = KYCNetworkTypeUnkown;
    switch (internetStatus) {
        case ReachableViaWiFi:
            net = KYCNetworkTypeWifi;
            break;
        case ReachableViaWWAN:
            //判断具体类型
            net = [self getWWANType];
            break;
            
        case NotReachable:
            net = KYCNetworkTypeNotReachable;
            
        default:
            break;
    }
    return net;
}
+ (KYCNetworkType)getWWANType
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    NSString *currentStatus = info.currentRadioAccessTechnology;
    NSDictionary *dict = @{
                           CTRadioAccessTechnologyGPRS : @(KYCNetworkType2G),
                           CTRadioAccessTechnologyEdge : @(KYCNetworkType2G),
                           CTRadioAccessTechnologyCDMA1x : @(KYCNetworkType2G),
                           CTRadioAccessTechnologyWCDMA : @(KYCNetworkType3G),
                           CTRadioAccessTechnologyHSDPA : @(KYCNetworkType3G),
                           CTRadioAccessTechnologyHSUPA : @(KYCNetworkType3G),
                           CTRadioAccessTechnologyCDMAEVDORev0 : @(KYCNetworkType3G),
                           CTRadioAccessTechnologyCDMAEVDORevA :@(KYCNetworkType3G),
                           CTRadioAccessTechnologyCDMAEVDORevB : @(KYCNetworkType3G),
                           CTRadioAccessTechnologyeHRPD : @(KYCNetworkType3G),
                           CTRadioAccessTechnologyLTE : @(KYCNetworkType4G),
                           };
    NSNumber *netconnType = [dict valueForKey:currentStatus] ? : @(KYCNetworkTypeUnkown);
    return netconnType.integerValue;
}
#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"
+ (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         //筛选出IP地址格式
         if([self isValidatIP:address]) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[ipAddress substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
            return YES;
        }
    }
    return NO;
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

+ (double)totalMemorySize {
    return [NSProcessInfo processInfo].physicalMemory / 1024.0 / 1024.0;
}

+ (double)availabaleMemorySize {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS)
    {
        return NSNotFound;
    }
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count)) / 1024.0 / 1024.0;
}

+ (double)usedMemory {
    
    task_basic_info_data_t taskInfo;
    
    mach_msg_type_number_t infoCount =TASK_BASIC_INFO_COUNT;
    
    kern_return_t kernReturn =task_info(mach_task_self(),
                                        
                                        TASK_BASIC_INFO,
                                        
                                        (task_info_t)&taskInfo,
                                        
                                        &infoCount);
    
    
    
    if (kernReturn != KERN_SUCCESS
        
        ) {
        
        return NSNotFound;
        
    }
    
    
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

+ (BOOL)isJailBreak {
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"User/Applications/"]) {
        NSArray *appList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"User/Applications/" error:nil];
        NSLog(@"appList = %@", appList);
        return YES;
    }
    NSArray *jailbreak_tool_paths = @[
                                      @"/Applications/Cydia.app",
                                      @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                                      @"/bin/bash",
                                      @"/usr/sbin/sshd",
                                      @"/etc/apt"
                                      ];
    for (int i=0; i<jailbreak_tool_paths.count; i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:jailbreak_tool_paths[i]]) {
            return YES;
        }
    }
    return NO;
}
+ (NSString *)deviceId {
    return [FCUUID uuidForDevice];
}
+ (NSString *)sessionId {
    return [FCUUID uuidForSession];
}
@end
