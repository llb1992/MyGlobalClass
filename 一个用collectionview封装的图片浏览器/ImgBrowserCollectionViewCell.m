//
//  ImgBrowserCollectionViewCell.m
//  WeiBu
//
//  Created by william on 16/6/2.
//  Copyright © 2016年 ibangk. All rights reserved.
//

#import "ImgBrowserCollectionViewCell.h"

@implementation ImgBrowserCollectionViewCell
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)setUserImg:(NSString *)userImg{
    
    _userImg = userImg;
    if ([self.contentView viewWithTag:1002]) {
        
        [[self.contentView viewWithTag:1002] removeFromSuperview];
    }
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    NSString *urlStr = [ServeHostlocal stringByAppendingString:userImg];
    //[imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {

        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    _imageView = imageView;
    imageView.tag = 1002;
    [self.contentView addSubview:imageView];
    
}

@end
