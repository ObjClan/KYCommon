//
//  KYCUtility.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#define KYCLog(format, ...) [KYCUtility log:(format), ##__VA_ARGS__]

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYCUtility : NSObject


/**
 开启调试模式

 @param enable YES开启，NO关闭
 */
+ (void)debugEnable:(BOOL)enable;

/**
 打印输出
 */
+ (void)log:(NSString *)format, ...;
@end

NS_ASSUME_NONNULL_END
