//
//  ImgBrowserCtr.h
//  WeiBu
//
//  Created by william on 16/6/2.
//  Copyright © 2016年 ibangk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgBrowserCtr : UIViewController
/**
 *  存放图片的数组
 */
@property (nonatomic,strong) NSArray *photos;
/**
 *  当前的index
 */
@property (nonatomic,assign) NSInteger currentIndex;
@end
