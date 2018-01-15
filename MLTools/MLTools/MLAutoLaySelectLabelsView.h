//
//  MLAutoLaySelectLabelsView.h
//
//  Created by Maria_Pang on 2018/1/12.
//  Copyright © 2018年 Maria_Pang All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MLAutoLaySelectLabelsViewDelegate <NSObject>

@optional
- (void)itemSelectViewWithButton:(UIButton *)button didSelectIndex:(NSInteger)index;

@end

@interface MLAutoLaySelectLabelsView : UIView
- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items;

@property(nonatomic, strong) UIButton *selectedButton;

@property(nonatomic, weak) id<MLAutoLaySelectLabelsViewDelegate> delegate;
@end
