//
//  NSData+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (KYC)
/**
 是否为可用的NSData，即不为空且length大于0
 */
- (BOOL)isAvailable;

/**
 转NSString
 */
- (NSString *)toString;
/**
  转base64 NSString
 */
- (NSString *)base64EncodeToString;
/**
 JSON Data转object
 */
- (id)JSONDataToObject;
/**
 JSON Data转NSDictionary
 */
- (NSDictionary *)JSONDataToDictionary;
/**
 JSON Data转NSArray
 */
- (NSArray *)JSONDataToArray;

@end

NS_ASSUME_NONNULL_END
