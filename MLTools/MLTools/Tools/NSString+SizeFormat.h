//
//  NSString+SizeFormat.h
//
//  Created by Maria_Pang on 2018/1/12.
//  Copyright © 2018年 Maria_Pang All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (SizeFormat)
- (CGSize)boundingRectWithSize:(CGSize)size fontOfLabel:(UIFont *)font;

- (CGSize)boundingRectWithFont:(UIFont *)font;

+ (NSString *)timeFormatTextWithSecond:(NSInteger)second;
+ (NSString *)getSerializationStrWithArray:(NSArray *)array;

+ (NSString *)dayDateForTime:(NSString*)time;

+ (NSString *)monthDateForTime:(NSString*)time;

+ (NSString *)getCountWithDecimalPoint:(CGFloat)count;

- (NSArray *)getArrayFromSerializationStr;

/**
 校验手机号
 */
- (BOOL)isMobileNumber;

/**
 校验数字和字母
 */
- (BOOL)isLetterNumber;

/**
 提取电话号码
 */
- (NSString *)getPhoneNumber;

- (BOOL)isNumberRail;
@end
