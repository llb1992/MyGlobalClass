//
//  DealWithString.m
//  testDemoJson
//
//  Created by william on 16/5/27.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "DealWithString.h"
#import "CommonCrypto/CommonDigest.h"

@implementation DealWithString

//字典转变为json串
+(NSString *)dictionaryChangeTypeBecomeJSONString:(NSDictionary *)dictionary{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

//数组转变为json串
+(NSString *)arrayChangeTypeBecomeJSONString:(NSArray *)array{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

//处理devicetoken变为连续的无符号字符串
+(NSString *)deailWithDeviceToken:(NSData *)deviceToken{
    NSString *token = [[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    return token;
}

//数组转换成以逗号隔开的字符串
+(NSString *)arraySeperateByCommaBecomeStrings:(NSArray *)array{
    
    return [array componentsJoinedByString:@","];
}

//字符创转换成以逗号分隔开来的数组
+(NSArray *)stringBecomeArrayByComma:(NSString *)string{
    
    return [string componentsSeparatedByString:@","];
}

//有符号字符串变为普通字符串
+(NSString *)symbolStringBecomeNormalString:(NSString *)string{
    [string rangeOfString:@">"];
    NSLog(@"%ld",[string rangeOfString:@">"].length);
    return string;
}

//MD5签名
+ (NSString *)md5HexDigest:(NSString *)string{
    
    const char* str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (unsigned int)strlen(str), result);
    
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}


@end
