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
    
    NSArray * items = @[@"问题优化",@"angel", @"积分相关",@"信息安全问题",@"提现困难",@"问题优化",@"quit",@"如何使用积分帮助",@"积分相关",@"信息安全问题",@"别难过",@"去旅行",@"hug",@"dog",@"除了你还有谁",@"IP",@"曼丽", @"哦",@"庞",@"google",@"just",@"离开",@"第一次排序",@"你在哪个城市", @"恩非常不错",@"我喜欢旅游呀",@"peak",@"反正我喜欢你", @"如何使用积分帮助",@"患难见真情",@"eagle",@"看过来",@"kit",@"积分相关",@"谷歌一下你就知道",@"爱你一万年",@"facebook",@"积分相关",@"杰伦变丑了",@"little",@"nut",@"站在巨人肩膀上", @"圆满",@"嘻嘻",@"matter",@"傻不傻",@"ok",@"bug"];
    
   //添加排序逻辑
   NSArray * newArr = [items sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
       
       return [obj1 localizedCompare:obj2];
    }];
    
    for (NSString * str in newArr) {
        
        NSLog(@"----- %@", [str description]);
    }

    
    MLAutoLaySelectLabelsView * selectView = [[MLAutoLaySelectLabelsView alloc]initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH - 20, self.view.frame.size.height - 50 ) items:newArr];

//    selectView.btnLabelMargin = GetLogicPixelX(100);
//    selectView.gapX  = 20;
    
    [self.view addSubview:selectView];
}





@end
