//
//  UINavigationController+KYC.m
//  KYCommon
//
//  Created by Key on 14/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UINavigationController+KYC.h"

@implementation UINavigationController (KYC)
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated completeBlock:(void (^)(void))completeBlock {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        if (completeBlock) {
            completeBlock();
        }
    }];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}

- (void)popViewControllerAnimated:(BOOL)animated completeBlock:(void (^)(void))completeBlock {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        if (completeBlock) {
            completeBlock();
        }
    }];
    [self popViewControllerAnimated:animated];
    [CATransaction commit];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated completeBlock:(void (^)(void))completeBlock {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        if (completeBlock) {
            completeBlock();
        }
    }];
    [self popToRootViewControllerAnimated:animated];
    [CATransaction commit];
}
@end
