//
//  ATToDownView.h
//  testDemo
//
//  Created by william on 16/6/20.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import <UIKit/UIKit.h>

//枚举
typedef enum : NSInteger {
    
    DefaultClickBtnTitleType = 0,//点击按钮的标题不随tableview的文字变化而变化
    ChangeClickBtnTitleType//点击按钮的标题随tableview的文字变化而变化
    
} ClickBtnTitleType;

@interface ATToDownView : UIView

@property (nonatomic ,assign) ClickBtnTitleType clickButtonTitleType;//点击按钮的类型

/**
 *点击按钮,显示下面的表视图
 */
@property (nonatomic, strong) UIButton *clickBtn;

/**
 *下拉的表视图
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *表视图的数据源
 */
@property (nonatomic, copy) NSArray *dataArr;//数据源

@end
