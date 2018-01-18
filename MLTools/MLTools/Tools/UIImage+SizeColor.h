//
//  UIImage+SizeColor.h
//
//  Created by Maria_Pang on 2018/1/12.
//  Copyright © 2018年 Maria_Pang All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SizeColor)
/**
 *  图片拉伸
 */
+ (UIImage *)resizedImage:(NSString *)name;

+ (UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;
+ (UIImage *)resizeImage:(UIImage*)originalImage withScale:(float)scale;

+ (UIImage *)createImageWithColor:(UIColor *)color;

+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
