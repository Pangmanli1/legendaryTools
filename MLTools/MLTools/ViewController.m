//
//  ViewController.m
//  MLTools
//
//  Created by Maria_Pang on 2018/1/15.
//  Copyright © 2018年 Maria_Pang. All rights reserved.
//

#import "ViewController.h"
#import "MLAutoLaySelectLabelsView.h"

#define COLOR(R, G, B, A)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * items = @[@"问题优化",@"bug", @"积分相关",@"信息安全问题",@"提现困难", @"如何使用积分帮助"];
    self.view.backgroundColor = COLOR(252, 157, 154, 1.0);
    MLAutoLaySelectLabelsView * selectView = [[MLAutoLaySelectLabelsView alloc]initWithFrame:CGRectMake(20, 200, SCREEN_WIDTH - 2 * 20, 100) items:items];
    [self.view addSubview:selectView];
}



@end
