//
//  UITextField+KYC.m
//  KYCommon
//
//  Created by Key on 14/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "UITextField+KYC.h"

@implementation UITextField (KYC)

-(UIColor*)placeHolderColor{
    return self.placeHolderColor;
}
-(void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder?self.placeholder:@"default"
                                                                 attributes:@{NSForegroundColorAttributeName: placeHolderColor
                                                                              }];
}
@end
