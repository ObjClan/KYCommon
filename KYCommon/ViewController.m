//
//  ViewController.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "ViewController.h"
#import "KYCUtility.h"
#import "UIColor+KYC.h"
#import "NSDictionary+KYC.h"
#import "NSArray+KYC.h"
#import "NSData+KYC.h"
#import "NSString+KYC.h"
#import "UIImage+KYC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //开启调试模式
#if DEBUG
    [KYCUtility debugEnable:YES];
#endif
    //打印输出
    KYCLog(@"%@",@"sdfsdfdsfdsfdsf");
    
    //十六进制颜色
    self.view.backgroundColor = [UIColor HEX2Color:0xfff000 inAlpha:1];
    
    //渐变layer
    CAGradientLayer* layer = [UIColor gradientLayerWithBounds:CGRectMake(20, 50, 200, 200)
                                                       colors:@[[UIColor whiteColor],[UIColor blackColor],[UIColor redColor]]
                                                   startPoint:CGPointMake(0, 0)
                                                     endPoint:CGPointMake(1, 1)
                                                    locations:@[@(0.0f),@(0.5),@(1.0f)]];
    [self.view.layer insertSublayer:layer atIndex:0];

    //NSDictionary转JSON
    NSDictionary *dict = @{@"name" : @"sdfdsfsdf",@"pwd" : @"111111"};
    KYCLog(@"字典转JSON:\n%@",[dict toJSONString]);
    //NSArray转JSON
    NSArray *array = @[@"1111",@"22222",@"33333"];
    KYCLog(@"数组转JSON:\n%@",[array toJSONString]);
    
    //NSData转object
    NSData *data = [dict toData];
    KYCLog(@"data转object:\n%@",[data JSONDataToObject]);
    //NSData转字典
    KYCLog(@"data转字典:\n%@",[data JSONDataToDictionary]);
    //NSData转数组
    NSData *data1 = [array toData];
    KYCLog(@"data转数组:\n%@",[data1 JSONDataToArray]);
    KYCLog(@"data转NSString:\n%@",[data1 toString]);
    KYCLog(@"data转base64 NSString:\n%@",[data1 base64EncodeToString]);
    
    //NSString转NSData
    NSString *string =  [data1 toString];
    KYCLog(@"NSString转data:\n%@",[string toData]);
    NSString *string1 =  [data1 base64EncodeToString];
    KYCLog(@"base64 NSString转data,未解码:\n%@",[string1 toData]);
    KYCLog(@"base64 NSString转data，已解码:\n%@",[string1 base64DecodeToData]);
    
}


@end
