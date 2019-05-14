//
//  NSDictionary+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (KYC)
/**
 是否为可用的NSDictionary，即不为空且count大于0
 */
- (BOOL)isAvailable;
/**
 转NSData
 */
- (NSData *)toData;
/**
 转JSON字符串
 */
- (NSString *)toJSONString;
@end

NS_ASSUME_NONNULL_END
