//
//  UIApplication+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (KYC)

/**
 app版本号
 */
+ (NSString *)appVersion;

/**
 build版本号
 */
+ (NSString *)buildVersion;
/**
 bundleIdentifier
 */
+ (NSString *)bundleIdentifier;
/**
 app名称
 */
+ (NSString *)getAppName;
/**
 退出App
 */
+ (void)exitApp;

/**
 跳转URL
 */
+ (BOOL)openUrl:(NSURL *)url;

/**
 当前UIViewController
 */
+ (UIViewController*)TopViewController;
@end

NS_ASSUME_NONNULL_END
