//
//  ImgBrowserLayout.m
//  WeiBu
//
//  Created by william on 16/6/2.
//  Copyright © 2016年 ibangk. All rights reserved.
//

#import "ImgBrowserLayout.h"

@implementation ImgBrowserLayout

-(void)prepareLayout{
    [super prepareLayout];
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    //设置item的大小
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width,
                             self.collectionView.frame.size.height);
    //设置item的缩进
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

}

// 2.重写此方法，返回rect范围内每个item的LayoutAttributes。
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        CGFloat delta = ABS(centerX - attrs.center.x);
        
        CGFloat scale = 1 - delta / self.collectionView.frame.size.width;
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    

    return array;
}


-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
