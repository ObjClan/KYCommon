//
//  UIDevice+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,KYCNetworkType){
    KYCNetworkTypeUnkown = 0,//未知
    KYCNetworkTypeNotReachable = 1,//无网络
    KYCNetworkTypeWifi = 2,// wifi
    KYCNetworkType2G = 3,// 2G
    KYCNetworkType3G = 4,// 3G
    KYCNetworkType4G = 5,// 4G
};

@interface UIDevice (KYC)


#pragma mark ----------------------网络相关-------------------------

/**
 获取手机名
 */
+ (NSString *)iPhoneName;
/**
 营运商
 */
+ (NSString *)carrierName;
/**
 当前网络状态
 */
+ (KYCNetworkType)getNetType;


/**
 获取本机内网IP

 @param isIPV4 是否为ipv4格式
 */
+ (NSString *)getIPAddress:(BOOL)isIPV4;

#pragma mark ----------------------内存相关-------------------------
/**
 总内存
 */
+ (double)totalMemorySize;

/**
 可用内存
 */
+ (double)availabaleMemorySize;

/**
 APP使用内存
 */
+ (double)usedMemory;
#pragma mark ----------------------设备ID相关-------------------------

/**
 每次运行应用都会变
 */
+ (NSString *)sessionId;

/**
 抹掉iPhone的时候才会变，适合做唯一标识
 */
+ (NSString *)deviceId;

#pragma mark ----------------------其他-------------------------
/**
 是否越狱
 */
+ (BOOL)isJailBreak;
@end

NS_ASSUME_NONNULL_END
