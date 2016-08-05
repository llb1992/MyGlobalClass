//
//  ATArray.m
//  testDemo
//
//  Created by william on 16/6/20.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "ATArray.h"

@implementation ATArray

//获取字体名称的数组
+ (NSArray *)arrayAboutFontNames{
    
    NSArray *array = [NSArray arrayWithArray:[UIFont familyNames]];
    return array;
}

@end
