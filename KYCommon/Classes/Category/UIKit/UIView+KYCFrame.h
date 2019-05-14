//
//  UIView+KYCFrame.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KYCFrame)
/**
 *  左边距
 */
@property (nonatomic) CGFloat left;
/**
 *  顶部边距
 */
@property (nonatomic) CGFloat top;
/**
 *  右边距
 */
@property (nonatomic) CGFloat right;

/**
 *  高度
 */
@property (nonatomic) CGFloat height;

- (CGFloat)width;

- (CGFloat)height;

- (CGFloat)bottom;


#pragma mark - Member

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;

@property (nonatomic, assign, readonly) CGFloat midW;
@property (nonatomic, assign, readonly) CGFloat midH;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign, readonly) CGRect frameApplyAffineTransform;

@property (nonatomic, assign, readonly) CGPoint pointInWindow;
@property (nonatomic, assign, readonly) CGRect rectInWindow;

#pragma mark - Setter

- (void)setX:(CGFloat)x Y:(CGFloat)y;
- (void)setW:(CGFloat)w H:(CGFloat)h;
- (void)setX:(CGFloat)x Y:(CGFloat)y W:(CGFloat)w H:(CGFloat)h;
@end

NS_ASSUME_NONNULL_END
