//
//  MLAutoLaySelectLabelsView.m
//
//  Created by Maria_Pang on 2018/1/12.
//  Copyright © 2018年 Maria_Pang All rights reserved.
//

#import "MLAutoLaySelectLabelsView.h"
#import "UIImage+SizeColor.h"
#import "NSString+SizeFormat.h"

#define COLOR(R, G, B, A)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
//6s 为标准机型
#define LOGIC_DEVICE_WIDTH   (750)
#define CH_IPHONE6_OR_LATER ([[UIScreen mainScreen] bounds].size.height > 568)
#define IS_IPHONE_6P_7P ([[UIScreen mainScreen] bounds].size.height >= 736.0)
#define GetLogicPixelX(value) ((SCREEN_WIDTH/LOGIC_DEVICE_WIDTH)*(value))

@implementation MLAutoLaySelectLabelsView

-(instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUIWithItems:items];
    }
    return self;
}

-(void)setUIWithItems:(NSArray *)items {
    
    if (items.count <= 1) {
        return;
    }
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"APP问题反馈";
    titleLabel.textColor = COLOR(0x33, 0x33, 0x33, 1.0);
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.frame = CGRectMake(15, 0, 100, 16);
    [self addSubview:titleLabel];
    
    CGFloat buttonW = GetLogicPixelX(110); //预设初始值 ,循环创建时根据字长重设
    CGFloat buttonH = 33;
    CGFloat buttonX = 15; //button 的X 坐标值
    CGFloat buttonY = CGRectGetMaxY(titleLabel.frame)+15;
    CGFloat marginX = 15; //左右边距
    CGFloat gapY = 10; //垂直间隙
    
    //以下两项可根据需求调整 (The two items below are adjustable to get the right UI)
    //The gap between the edge of button and its label edge
    CGFloat btnLabelMargin = GetLogicPixelX(10);
    
    //水平间隙(按 5个宽度为110px的按钮计算,可调整)
    //The gap between each button
    CGFloat gapX = (SCREEN_WIDTH - GetLogicPixelX(20) * 4 - buttonW * 5 - marginX * 2)/4.0;
    
    //iPhone 5s 等小尺寸适配
    if (!CH_IPHONE6_OR_LATER) {
        btnLabelMargin = GetLogicPixelX(5);
        gapX = (SCREEN_WIDTH - GetLogicPixelX(24) * 4 - buttonW * 5 - marginX * 2)/4.0 ;
    }
    for (int index = 0; index < items.count; index ++) {
        NSString * title = items[index];
        CGSize fontSize = [title boundingRectWithFont:[UIFont systemFontOfSize:12]];
        buttonW = fontSize.width + btnLabelMargin * 2;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [button setBackgroundImage:[UIImage createImageWithColor:COLOR(0x05, 0x82, 0xc8, 1.0)] forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage createImageWithColor:COLOR(0x05, 0x82, 0xc8, 1.0)] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage createImageWithColor:COLOR(0xf5, 0xf5, 0xf5, 1.0)] forState:UIControlStateNormal];
        
        //处理换行(值考虑两行以下的情况)
        if ((CGRectGetMaxX(button.frame) - marginX)> self.frame.size.width ) {
            buttonY += gapY + buttonH;
            buttonX = 15;
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        }

        [button setTitle:items[index] forState:UIControlStateNormal];
        [button setTitle:items[index] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [button setTitleColor:COLOR(0x9d, 0x9d, 0x9d, 1.0) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.tag = index+5;
        [self addSubview:button];
        buttonX += buttonW + gapX;
    }
    
    //换行后自身高度改变
    if (buttonY > CGRectGetMaxY(titleLabel.frame)+15 ) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, buttonY + buttonH);
    }

}



- (void)buttonClick:(UIButton *)sender
{
//打开注释支持单选
//    if ([self.selectedButton isEqual:sender]) {
//        return;
//    }
//
//    self.selectedButton.selected = NO;
//    self.selectedButton = sender;
    
    if ([_delegate respondsToSelector:@selector(itemSelectViewWithButton:didSelectIndex:)]) {
        [_delegate itemSelectViewWithButton:self.selectedButton didSelectIndex:sender.tag];
    }
    
    sender.selected = YES;
}



@end
