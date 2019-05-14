//
//  NSString+KYC.h
//  KYCommon
//
//  Created by Key on 13/05/2019.
//  Copyright © 2019 Key. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (KYC)

/**
 是否为可用的NSString，即不为空且length大于0
 */
- (BOOL)isAvailable;
#pragma mark ---------------转化相关---------------------
/**
 转NSData
 */
- (NSData *)toData;
/**
 Base64解码后转NSData
 */
- (NSData *)base64DecodeToData;

/**
 转换货币字符串
 */
- (NSString *)toMoneyString;

#pragma mark ---------------URL相关---------------------
/**
 url解码
 */
-(NSString *)URLDecode;

/**
 对url的参数编码

 */
- (NSString *)URLQueryEncode;

/**
 对某些字符urlencode编码

 @param characters 如@"#!$%@"
 */
- (NSString *)URLEncodeWithCharacters:(NSString *)characters;
/**
 拼接url参数
 
 @param query 参数
 */
- (NSString *)URLAppendingQuery:(NSDictionary *)query;

/**
 去掉两端空格和换行符
 */
- (NSString *)removeSpace;

#pragma mark ---------------校验相关---------------------
/**
 邮箱验证
 */
- (BOOL)isValidEmail;
/**
 检查比特币地址是否合法
 */
- (BOOL)isValidBTCAddress;
/**
 手机号码验证
 */
- (BOOL)isValidPhoneNum;

/**
 车牌号验证
 */
- (BOOL)isValidCarNo;

/**
 网址验证
 */
- (BOOL)isValidUrl;

/**
 邮政编码
 */
- (BOOL)isValidPostalcode;

/**
 纯汉字
 */
- (BOOL)isValidChinese;

/**
 验证特殊字符
 */
- (BOOL)isValidSpecialString;

/**
 是否符合IP格式，xxx.xxx.xxx.xxx
 */
- (BOOL)isValidIP;

/**
 身份证验证
 */
- (BOOL)isValidIdCardNum;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

#pragma mark ---------------沙盒路径相关---------------------

/**
 document
 */
+ (NSString *)documentPath;

/**
 cache
 */
+ (NSString *)cachePath;

/**
 temp
 */
+ (NSString *)tempPath;


@end

NS_ASSUME_NONNULL_END
