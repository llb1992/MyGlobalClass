//
//  UIView+Extension.m
//  testDemoJson
//
//  Created by william on 16/6/7.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setLeft:(CGFloat)left{
    self.left = self.frame.origin.x;
}

- (CGFloat)left{
    return self.frame.origin.x;
}

-(void)setTop:(CGFloat)top{
    self.top = self.frame.origin.y;
}

- (CGFloat)top{
    return self.frame.origin.y;
}

-(void)setRight:(CGFloat)right{
    self.right = self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setBottom:(CGFloat)bottom{
    self.bottom = self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setWidth:(CGFloat)width{
    self.width = self.frame.size.width;
}

- (CGFloat)width{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{
    self.height = self.frame.size.height;
}

- (CGFloat)height{
    return self.frame.size.height;
}

-(void)setPoint:(CGPoint)point{
    self.point = CGPointMake(self.left, self.top);
}

-(void)setSize:(CGSize)size{
    self.size = CGSizeMake(self.width, self.height);
}

-(CGPoint)point{
    return CGPointMake(self.left, self.top);
}

-(CGSize)size{
    return CGSizeMake(self.width, self.height);
}

@end
