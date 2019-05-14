//
//  NSDateFormatter+KYC.m
//  KYCommon
//
//  Created by Key on 14/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "NSDateFormatter+KYC.h"

@implementation NSDateFormatter (KYC)
+ (id)dateFormatter
{
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter
{
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
@end
