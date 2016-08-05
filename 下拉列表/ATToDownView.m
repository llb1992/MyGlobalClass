//
//  ATToDownView.m
//  testDemo
//
//  Created by william on 16/6/20.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "ATToDownView.h"

#define SpaceHeight 5.0
#define CommonColor [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5]

@interface ATToDownView() <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) CGFloat itemHeight;//item的高度

@end

@implementation ATToDownView

- (instancetype)initWithFrame:(CGRect)frame{
    
    _itemHeight = 30;
    
    if (self = [super initWithFrame:frame]) {
    
        //设置初始的坐标
        CGFloat width = self.frame.size.width;
        
        //初始化点击按钮
        _clickBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, width, _itemHeight)];
        [_clickBtn setTitle:@"选择按钮" forState:UIControlStateNormal];
        [_clickBtn setTitleColor:CommonColor forState:UIControlStateNormal];
        _clickBtn.layer.borderWidth = 1;
        _clickBtn.layer.borderColor = [CommonColor CGColor];
        [_clickBtn addTarget:self.inputViewController action:@selector(showAndHiddenTableView:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_clickBtn];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setDataArr:(NSArray *)dataArr{
    
    _dataArr = dataArr;
    CGRect frame = self.frame;
    
    //初始化表视图
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, _clickBtn.frame.size.height, self.frame.size.width, _itemHeight * _dataArr.count)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = [CommonColor CGColor];
    _tableView.scrollEnabled = NO;
    _tableView.hidden= YES;
    [self addSubview:_tableView];
    
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, _itemHeight * (_dataArr.count + 1));
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _itemHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = CommonColor;
    
    UILabel *ge = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 1)];
    ge.backgroundColor = CommonColor;
    [cell.contentView addSubview:ge];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //此处调用item执行的方法
    NSLog(@"我要:%@",_dataArr[indexPath.row]);
    switch (_clickButtonTitleType) {
        case ChangeClickBtnTitleType:{
            
            [_clickBtn setTitle:_dataArr[indexPath.row] forState:UIControlStateNormal];
            break;
        }
            
        default:{
            
            
            break;
        }
    }
}

- (void)showAndHiddenTableView:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        
        _tableView.hidden = NO;
    }else{
        
        _tableView.hidden = YES;
    }
}

@end
