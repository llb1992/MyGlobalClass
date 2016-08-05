//
//  DealWithString.h
//  testDemoJson
//
//  Created by william on 16/5/27.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DealWithString : NSObject
/**
 *字典转变为JSON字符串
 */
+(NSString *)dictionaryChangeTypeBecomeJSONString:(NSDictionary *)dictionary;

/**
 *数组转变为JSON字符串
 */
+(NSString *)arrayChangeTypeBecomeJSONString:(NSArray *)array;

/**
 *处理devicetoken变为连续的无符号字符串
 */
+(NSString *)deailWithDeviceToken:(NSData *)deviceToken;

/**
 *数组转换成以逗号隔开的字符串
 */
+(NSString *)arraySeperateByCommaBecomeStrings:(NSArray *)array;

/**
 *字符创转换成以逗号分隔开来的数组
 */
+(NSArray *)stringBecomeArrayByComma:(NSString *)string;

/**
 *MD5签名
 */
+ (NSString *)md5HexDigest:(NSString *)string;

@end
