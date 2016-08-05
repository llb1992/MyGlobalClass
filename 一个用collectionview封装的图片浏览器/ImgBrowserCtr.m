//
//  ImgBrowserCtr.m
//  WeiBu
//
//  Created by william on 16/6/2.
//  Copyright © 2016年 ibangk. All rights reserved.
//

#import "ImgBrowserCtr.h"
#import "ImgBrowserCollectionViewCell.h"
#import "ImgBrowserLayout.h"

@interface ImgBrowserCtr () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;//用于显示图片
    UIScrollView *_scrollView;//保留的属性用于以后双击放大
}
@end

//设置静态NSString用于注册cell
static NSString *indentifier = @"ImgBrowserCollectionViewCell";

@implementation ImgBrowserCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加点击返回手势
    self.view.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickBack)];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addGestureRecognizer:tap];
    
    //创建UICollectionView
    ImgBrowserLayout *layout = [[ImgBrowserLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) collectionViewLayout:layout];
    
    [_collectionView registerClass:[ImgBrowserCollectionViewCell class] forCellWithReuseIdentifier:indentifier];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.bounces = NO;
    _collectionView.pagingEnabled = YES;
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    [self.view addSubview:_collectionView];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (!_photos) {
        return 0;
    }
    return _photos.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    ImgBrowserCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    cell.userImg = _photos[indexPath.item];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    return cell;
}

#pragma mark - 隐藏状态栏和导航栏
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - 显示状态栏和导航栏
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - 点击手势返回
-(void)tapClickBack{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
