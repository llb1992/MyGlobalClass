//
//  ATSorting.m
//  testDemoJson
//
//  Created by william on 16/6/13.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//  排序类

#import "ATSorting.h"

@implementation ATSorting

//按照ASII的大小对字典按照从小到大的顺序进行排列生成新的字典
+(NSDictionary *)dictionarySortingOrderedDescending:(NSDictionary *)dic{
    NSArray* arr = [dic allKeys];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedDescending;
    }];
    return dic;
}

//按照ASII的大小对字典按照从大到小的顺序进行排列生成新的字典
+(NSDictionary *)dictionarySortingOrderedAscendingBy:(NSDictionary *)dic{
    NSArray* arr = [dic allKeys];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedAscending;
    }];
    return dic;
}

//按照ASII码的大小对字典的key按照从小到大的顺序生成新的key数组
+(NSArray *)dictionaryByOrderedDescending:(NSDictionary *)dic{
    NSArray* arr = [dic allKeys];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedDescending;
    }];
    return arr;
}

//按照ASII码的大小对字典的key按照从大到小的顺序生成新的key数组
+(NSArray *)dictionaryByOrderedAscending:(NSDictionary *)dic{
    NSArray* arr = [dic allKeys];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedAscending;
    }];
    return arr;
}

@end
