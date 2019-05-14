//
//  UILabel+KYC.m
//  KYCommon
//
//  Created by Key on 14/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UILabel+KYC.h"

@implementation UILabel (KYC)

- (CGSize)calculateHeight:(CGFloat)width {
    // 宽度不变，根据字的多少计算label的高度
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size;
}

- (CGSize)calculateWidth:(CGFloat)height {
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT,height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size;
}

- (CGSize)calculateSize {
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size;
}
@end
