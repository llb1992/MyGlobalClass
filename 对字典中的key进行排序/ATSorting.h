//
//  ATSorting.h
//  testDemoJson
//
//  Created by william on 16/6/13.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//  排序类

#import <Foundation/Foundation.h>

@interface ATSorting : NSObject

/**
 *按照ASII的大小对字典按照从小到大的顺序进行排列生成新的字典
 */
+(NSDictionary *)dictionarySortingOrderedDescending:(NSDictionary *)dic;

/**
 *按照ASII的大小对字典按照从大到小的顺序进行排列生成新的字典
 */
+(NSDictionary *)dictionarySortingOrderedAscendingBy:(NSDictionary *)dic;

/**
 *按照ASII码的大小对字典的key按照从小到大的顺序生成新的key数组
 */
+(NSArray *)dictionaryByOrderedDescending:(NSDictionary *)dic;

/**
 *按照ASII码的大小对字典的key按照从大到小的顺序生成新的key数组
 */
+(NSArray *)dictionaryByOrderedAscending:(NSDictionary *)dic;

@end
