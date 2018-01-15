//
//  NSString+SizeFormat.m
//
//  Created by Maria_Pang on 2018/1/12.
//  Copyright © 2018年 Maria_Pang All rights reserved.
//

#import "NSString+SizeFormat.h"

@implementation NSString (SizeFormat)
- (CGSize)boundingRectWithSize:(CGSize)size fontOfLabel:(UIFont *)font
{
    return [self boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]
                              context:nil].size;
}

- (CGSize)boundingRectWithFont:(UIFont *)font
{
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]
                              context:nil].size;
}

+ (NSString *)timeFormatTextWithSecond:(NSInteger)second
{
    NSInteger hourNumber = second/3600;
    NSInteger minuteNumber = (second - hourNumber*3600) /60;
    NSInteger secondNumber = second % 60;
    
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hourNumber,(long)minuteNumber,(long)secondNumber];
}

+ (NSString *)dayDateForTime:(NSString*)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:time];
    [dateFormatter setDateFormat:@"dd"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)monthDateForTime:(NSString*)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:time];
    [dateFormatter setDateFormat:@"MM"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)getSerializationStrWithArray:(NSArray *)array
{
    NSArray *pois = [array copy];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:pois
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
        
        jsonString = @"";
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

- (NSArray *)getArrayFromSerializationStr
{
    NSData *data =[self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

- (BOOL)isMobileNumber
{
    //    NSString *MOBILE = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSString *MOBILE = @"^1[2|3|4|5|6|7|8|9][0-9]\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject: self];
}

- (BOOL)isLetterNumber
{
    NSString *Letter = @"^[A-Za-z0-9]+$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Letter];
    return [regextestmobile evaluateWithObject: self];
}


- (BOOL)isNumber
{
    NSString *Letter = @"^[0-9]*$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Letter];
    return [regextestmobile evaluateWithObject: self];
}

// 数字 -
- (BOOL)isNumberRail
{
    NSString *Letter = @"^[0-9,-]*$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Letter];
    return [regextestmobile evaluateWithObject: self];
}

- (NSString *)getPhoneNumber
{
    if (self == nil || [self isEqual:[NSNull null]]) {
        return nil;
    }
    
    BOOL isHaveNumber = NO;
    
    NSString *noneSpace = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    for (int i = 0; i < noneSpace.length; i++) {
        NSString *str = [noneSpace substringWithRange:NSMakeRange(i, 1)];
        
        if ([str isNumberRail]) {
            isHaveNumber = YES;
        }
        
        if (isHaveNumber) {
            
            if (![str isNumberRail]) {
                
                return [[noneSpace substringWithRange:NSMakeRange(0, i)] getNumber];
            }
        }
    }
    
    return [noneSpace getNumber];
}

- (NSString *)getNumber
{
    NSMutableString *mutableStr = [NSMutableString string];
    for (int i = 0; i < self.length; i++) {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        if ([str isNumber]) {
            [mutableStr appendString:str];
        }
    }
    
    return mutableStr;
}

+ (NSString *)countNumberForComment:(NSString*)count
{
    NSInteger countNumber = [count integerValue];
    
    if (countNumber < 10000) {
        return [NSString stringWithFormat:@"%ld",(long)countNumber];
    } else if (countNumber >= 999500) {
        
        return @"999k+";
    } else {
        
        return [NSString stringWithFormat:@"%.0fk",countNumber/1000.0];
    }
}

+ (NSString *)getCountWithDecimalPoint:(CGFloat)count
{
    if (fmodf(count, 1)==0) {
        return [NSString stringWithFormat:@"%.0f",count];
    } else if (fmodf(count*10, 1)==0) {
        return [NSString stringWithFormat:@"%.1f",count];
    } else {
        return [NSString stringWithFormat:@"%.2f",count];
    }
}




@end
