//
//  ATWebController.m
//  testDemoJson
//
//  Created by william on 16/6/17.
//  Copyright © 2016年 iabngk.com. All rights reserved.
//

#import "ATWebController.h"

@interface ATWebController ()

@end

@implementation ATWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *直接跳转网站的方法
 */
+ (void)goToWebURLMethod:(NSString *)urlString{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
