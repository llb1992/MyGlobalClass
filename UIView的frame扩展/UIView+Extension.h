//
//  UIView+Extension.h
//  testDemoJson
//
//  Created by william on 16/6/7.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *视图的坐标
 */
@property (nonatomic,assign) CGPoint point;

/**
 *视图的X坐标
 */
@property (nonatomic,assign) CGFloat left;

/**
 *视图的右边坐标
 */
@property (nonatomic,assign) CGFloat right;

/**
 *视图的Y坐标
 */
@property (nonatomic,assign) CGFloat top;

/**
 *视图的底部坐标
 */
@property (nonatomic,assign) CGFloat bottom;

/**
 *视图的尺寸
 */
@property (nonatomic,assign) CGSize size;

/**
 *视图的宽度
 */
@property (nonatomic,assign) CGFloat width;

/**
 *视图的高度
 */
@property (nonatomic,assign) CGFloat height;

@end
