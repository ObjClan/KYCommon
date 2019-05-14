//
//  UIView+KYCFrame.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UIView+KYCFrame.h"

@implementation UIView (KYCFrame)
- (CGFloat)left{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)width{
    return self.frame.size.width;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (CGFloat)bottom{
    return self.frame.origin.y+self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


#pragma mark - X

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.origin.x;
}

#pragma mark - Y

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.origin.y;
}

#pragma mark - W

- (void)setW:(CGFloat)w {
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

- (CGFloat)w {
    return self.size.width;
}

#pragma mark - H

- (void)setH:(CGFloat)h {
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}

- (CGFloat)h {
    return self.size.height;
}

#pragma mark - MidW

- (CGFloat)midW {
    return self.w * .5f;
}

#pragma mark - MidH

- (CGFloat)midH {
    return self.h * .5f;
}

#pragma mark - CenterX

- (void)setCenterX:(CGFloat)centerX {
    [self setCenter: CGPointMake(centerX, self.centerY)];
}

- (CGFloat)centerX {
    return self.center.x;
}

#pragma mark - CenterY

- (void)setCenterY:(CGFloat)centerY {
    [self setCenter: CGPointMake(self.centerX, centerY)];
}

- (CGFloat)centerY {
    return self.center.y;
}

#pragma mark - Origin

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

#pragma mark - Size

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (CGSize)size {
    return self.frame.size;
}

#pragma mark - Top


#pragma mark - bottom

- (void)setBottom:(CGFloat)bottom {
    [self setY: bottom - self.h];
}

#pragma mark - frameApplyAffineTransform

- (CGRect)frameApplyAffineTransform {
    return CGRectApplyAffineTransform(self.frame, self.transform);
}

#pragma mark - pointInWindow

- (CGPoint)pointInWindow {
    return [self convertPoint:self.origin toView:nil];
}

- (CGRect)rectInWindow {
    return [self convertRect:self.bounds toView:nil];
}

#pragma mark - Frame

- (void)setX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h {
    [self setFrame: CGRectMake(x, y, w, h)];
}

- (void)setX:(CGFloat)x Y:(CGFloat)y {
    [self setOrigin:CGPointMake(x, y)];
}

- (void)setW:(CGFloat)w H:(CGFloat)h {
    [self setSize: CGSizeMake(w, h)];
}
@end
