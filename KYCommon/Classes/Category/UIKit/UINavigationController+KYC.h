//
//  UINavigationController+KYC.h
//  KYCommon
//
//  Created by Key on 14/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (KYC)
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completeBlock:(void (^)(void))completeBlock;

- (void)popViewControllerAnimated:(BOOL)animated completeBlock:(void (^)(void))completeBlock;

- (void)popToRootViewControllerAnimated:(BOOL)animated completeBlock:(void (^)(void))completeBlock;
@end

NS_ASSUME_NONNULL_END
