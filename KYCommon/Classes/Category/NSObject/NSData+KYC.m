//
//  NSData+KYC.m
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import "NSData+KYC.h"
#import "NSDictionary+KYC.h"
#import "NSArray+KYC.h"
@implementation NSData (KYC)

- (BOOL)isAvailable
{
    if (self == nil || self == NULL){
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]){
        return NO;
    }
    if (![self isKindOfClass:[NSData class]]) {
        return NO;
    }
    if (self.length == 0){
        return NO;
    }
    return YES;
}
- (NSString *)toString
{
    if (![self isAvailable]) {
        return nil;
    }
    NSString *string = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    return string;
}
- (NSString *)base64EncodeToString
{
    if (![self isAvailable]) {
        return nil;
    }
    NSString *string = [self base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return string;
}
- (NSDictionary *)JSONDataToDictionary
{
    if (![self isAvailable]) {
        return nil;
    }
    NSDictionary *dict = [self JSONDataToObject];
    if (![dict isAvailable]) {
        return nil;
    }
    return dict;
}
- (NSArray *)JSONDataToArray
{
    if (![self isAvailable]) {
        return nil;
    }
    NSArray *array = [self JSONDataToObject];
    if (![array isAvailable]) {
        return nil;
    }
    return array;
}
- (id)JSONDataToObject
{
    if (![self isAvailable]) {
        return nil;
    }
    NSError *error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        return nil;
    }
    return obj;
}

@end
