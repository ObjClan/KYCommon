//
//  UIImage+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (KYC)

/**
 绘制单色背景图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 */
- (UIImage *)colorizeImageWithColor:(UIColor *)theColor;
/**
 *  根据图片返回一张高斯模糊的图片
 *
 *  @param blur 模糊系数
 *
 *  @return 新的图片
 */
- (UIImage *)boxblurImageWithBlur:(CGFloat)blur;

@end

NS_ASSUME_NONNULL_END
