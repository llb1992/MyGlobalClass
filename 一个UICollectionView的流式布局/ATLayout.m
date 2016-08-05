//
//  ATLayout.m
//  testDemoJson
//
//  Created by william on 16/6/4.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//  流式布局的一个例子

#import "ATLayout.h"

@implementation ATLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置最小列边距和最小行边距,如果不要设为0
    self.minimumLineSpacing = 50;
    self.minimumInteritemSpacing = 100;
    
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    
    //设定上左下右的边距,如果是全屏显示则都为0
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

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

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat Margin = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(Margin) > ABS(attrs.center.x - centerX)) {
            Margin = attrs.center.x - centerX;
        }
    }
    
    proposedContentOffset.x += Margin;
    return proposedContentOffset;
}

@end
