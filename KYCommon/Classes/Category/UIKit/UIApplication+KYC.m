//
//  UIApplication+KYC.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UIApplication+KYC.h"

@implementation UIApplication (KYC)
+ (NSString *)appVersion
{
    return  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}
+ (NSString *)buildVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}
+ (NSString *)bundleIdentifier
{
    return [[NSBundle mainBundle] bundleIdentifier];
}
+ (NSString *)getAppName{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
}
+ (void)exitApp
{
    UIWindow *keyWin = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:1.0f animations:^{
        keyWin.alpha = 0;
    } completion:^(BOOL finished) {
        exit(0);
    }];
}
+ (BOOL)openUrl:(NSURL *)url
{
    if (![[UIApplication sharedApplication] canOpenURL:url]) {
        return NO;
    }
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
    return YES;
}
+ (UIViewController*)topMostWindowController
{
    UIWindow *win = [UIApplication sharedApplication].delegate.window;
    if (!win) {
        win = [UIApplication sharedApplication].keyWindow;
    }
    if (!win) {
        return nil;
    }
    UIViewController *topController = [win rootViewController];
    if ([topController isKindOfClass:[UITabBarController class]]) {
        topController = [(UITabBarController *)topController selectedViewController];
    }
    while ([topController presentedViewController])  topController = [topController presentedViewController];
    return topController;
}
+ (UIViewController*)TopViewController;
{
    UIViewController *currentViewController = [self topMostWindowController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}
@end
