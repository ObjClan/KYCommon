//
//  UIColor+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (KYC)

/**
 RGBA颜色
 */
+ (UIColor *)RGB:(CGFloat)r andG:(CGFloat)g andB:(CGFloat)b alpha:(CGFloat)alp;
/**
 16进制颜色
 @param hexCode 十六进制整数,如:0xffffff
 @param alpha 透明度
 */
+ (UIColor *)HEX2Color:(NSInteger)hexCode inAlpha:(CGFloat)alpha;

/**
 渐变色layer
 
 @param bounds layer的bounds
 @param colors 颜色数组
 */

/**
 渐变色layer
 
 @param bounds layer的bounds
 @param colors 颜色数组
 @param startPoint 渐变轴线的起点
 @param endPoint 渐变轴线的终点
 startPoint和endPoint的连线决定颜色变化的方向，如连线为水平则水平变化，连线如垂直则垂直变化，连线为斜线则颜色斜向变化
 @param locations 各色值在轴线上的开始位置,两个色值开始位置之间为渐变部分,要与colors属性中的值一一对应。
 如有两个颜色@[[UIColor redColor],[UIColor blackColor]]，locations为@[@(0.3f),@(0.6f)],表示从0到0.3为纯red
 从0.3到0.6为red到black的渐变，从0.6到1为纯black
 */
+ (CAGradientLayer*)gradientLayerWithBounds:(CGRect)bounds
                                     colors:(NSArray<UIColor *> *)colors
                                 startPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint
                                  locations:(NSArray<NSNumber *> *)locations;
@end

NS_ASSUME_NONNULL_END
