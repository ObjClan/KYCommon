//
//  UIColor+KYC.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UIColor+KYC.h"

@implementation UIColor (KYC)
+ (UIColor *)RGB:(CGFloat)r andG:(CGFloat)g andB:(CGFloat)b alpha:(CGFloat)alp
{
    UIColor * color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alp];
    return color;
}
+ (UIColor *)HEX2Color:(NSInteger)hexCode inAlpha:(CGFloat)alpha
{
    float red   = ((hexCode >> 16) & 0x000000FF)/255.0f;
    float green = ((hexCode >> 8) & 0x000000FF)/255.0f;
    float blue  = ((hexCode) & 0x000000FF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CAGradientLayer*)gradientLayerWithBounds:(CGRect)bounds
                                     colors:(NSArray<UIColor *> *)colors
                                 startPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint
                                  locations:(NSArray<NSNumber *> *)locations
{
    NSMutableArray *mColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [mColors addObject:(__bridge id)color.CGColor];
    }
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = bounds;
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    layer.locations = locations;
    layer.colors = mColors.copy;
    return layer;
}
@end
