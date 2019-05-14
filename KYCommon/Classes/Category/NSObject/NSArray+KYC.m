//
//  NSArray+KYC.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "NSArray+KYC.h"

@implementation NSArray (KYC)
- (BOOL)isAvailable
{
    if (self == nil || self == NULL){
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]){
        return NO;
    }
    if (![self isKindOfClass:[NSArray class]]) {
        return NO;
    }
    if (self.count == 0){
        return NO;
    }
    return YES;
}
- (NSData *)toData
{
    if (![self isAvailable]) {
        return nil;
    }
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return nil;
    }
    return data;
}
- (NSString *)toJSONString
{
    NSData *data = [self toData];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}
@end
