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
//6s 为标准机型
#define LOGIC_DEVICE_WIDTH   (750)
#define CH_IPHONE6_OR_LATER ([[UIScreen mainScreen] bounds].size.height > 568)
#define IS_IPHONE_6P_7P ([[UIScreen mainScreen] bounds].size.height >= 736.0)
#define GetLogicPixelX(value) ((SCREEN_WIDTH/LOGIC_DEVICE_WIDTH)*(value))

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR(252, 157, 154, 1.0);
    
    NSArray * items = @[@"问题优化",@"bug", @"积分相关",@"信息安全问题",@"提现困难", @"如何使用积分帮助",@"问题优化",@"bug", @"积分相关",@"信息安全问题",@"提现困难", @"如何使用积分帮助"];
    
    MLAutoLaySelectLabelsView * selectView = [[MLAutoLaySelectLabelsView alloc]initWithFrame:CGRectMake(20, 200, SCREEN_WIDTH - 2 * 20, 100) items:items];
    
//    selectView.btnLabelMargin = GetLogicPixelX(100);
//    selectView.gapX  = 20;
    
    [self.view addSubview:selectView];
}



@end
