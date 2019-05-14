//
//  KYCUtility.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "KYCUtility.h"

@implementation KYCUtility

BOOL KYC_debug = NO;

+ (void)debugEnable:(BOOL)enable
{
    extern BOOL KYC_debug;
    KYC_debug = enable;
}

+ (void)log:(NSString *)format, ...
{
    if (!KYC_debug) {
        return;
    }
    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    printf("\n%s\n",[str UTF8String]);
}
@end
