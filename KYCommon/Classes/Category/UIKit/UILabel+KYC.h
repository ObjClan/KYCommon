//
//  UILabel+KYC.h
//  KYCommon
//
//  Created by Key on 14/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (KYC)

/**
 计算Label高度
 */
- (CGSize)calculateHeight:(CGFloat)width;

/**
 计算label宽度
 */
- (CGSize)calculateWidth:(CGFloat)height;

/**
 获取label单行尺寸
 */
- (CGSize)calculateSize;
@end

NS_ASSUME_NONNULL_END
