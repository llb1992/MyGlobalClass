//
//  ATSelectView.m
//  testDemo
//
//  Created by william on 16/6/21.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "ATSelectView.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define CommonColor [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5]
#define SpaceWidth 15

@interface ATSelectView()

@property (nonatomic ,assign) CGFloat itemWidth;//单元格的宽度

@property (nonatomic ,assign) CGFloat itemHeight;//单元格的高度

@property (nonatomic ,strong) UIView *sliderLine;//选项底部滑动的线

@property (nonatomic ,strong) UIView *showContentView;//显示内容的视图

@end

@implementation ATSelectView

- (instancetype)initWithFrame:(CGRect)frame{
    
    _itemHeight = 30;//设置单元格的高度默认为30
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:0.8];
    }
    return self;
}

- (void)setDataArr:(NSArray *)dataArr{
    
    _itemWidth = self.frame.size.width/dataArr.count;
    
    for (int i = 0; i < dataArr.count; i ++) {
        
        //生成item提供点击
        UIButton *item = [[UIButton alloc]initWithFrame:CGRectMake(i * _itemWidth, 0, _itemWidth, _itemHeight)];
        item.tag = 100 + i;
        item.backgroundColor = [UIColor clearColor];
        [item setTitle:dataArr[i] forState:UIControlStateNormal];
        [item setTitleColor:CommonColor forState:UIControlStateNormal];
        [item addTarget:self action:@selector(itemClickMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
        
    }
    //改变自身视图的高度
    CGRect frame = self.frame;

    _sliderLine = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x + SpaceWidth, _itemHeight, _itemWidth - 2 * SpaceWidth, 4)];
    _sliderLine.backgroundColor = [UIColor greenColor];
    [self addSubview:_sliderLine];
    
    frame.size.height = _itemHeight + _sliderLine.frame.size.height;
    self.frame = frame;
    
    //显示视图,用于显示内容
    _showContentView = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.size.height, ScreenWidth, ScreenHeight - frame.size.height - frame.origin.y - 49)];
    _showContentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_showContentView];
    
    UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake((_showContentView.frame.size.width - 100)/2, (_showContentView.frame.size.height - 50)/2, 100, 50)];
    testLabel.tag = 101;
    testLabel.text = dataArr[0];
    testLabel.textAlignment = NSTextAlignmentCenter;
    [_showContentView addSubview:testLabel];
    
    frame.size.height = _showContentView.frame.origin.y + _showContentView.frame.size.height;
    self.frame = frame;
}

- (void)itemClickMethod:(UIButton *)sender{
    
    //下划线的问题
    //第一步:先找到在哪个label下面
    UIButton *button = [self viewWithTag:sender.tag];
    CGRect frame = button.frame;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat height = frame.size.height;
    
    //第二步:改变sliderLine的frame值
    _sliderLine.frame = CGRectMake(x +SpaceWidth, y + height, _itemWidth - 2 * SpaceWidth, 2);
    
    //切换界面的问题,如何解决?
    //思路一:采用switch的方法,每次点击的时候创建一个新的view?
    //仔细一想感觉思路一纯属扯淡
    
    //思路二:跟下滑先方法类似
    UILabel *testLabel = [_showContentView viewWithTag:101];
    testLabel.text = button.titleLabel.text;
    [_showContentView addSubview:testLabel];
}

/**
 *这个方法预留,用来实现类似于网易新闻的动画效果
 */
//根据文字的字体大小跟文字来返回一个宽度
- (CGFloat)widthOfStringFontSize:(CGFloat)fontSize andString:(NSString *)string{
    
    return 0;
}

@end
