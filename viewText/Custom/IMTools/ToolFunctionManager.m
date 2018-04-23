//
//  QMSFunctionManager.m
//  QiMaiSi
//
//  Created by wuhaidong on 2017/7/18.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#import "ToolFunctionManager.h"

@implementation ToolFunctionManager

// NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date WithFormat:(NSString *)format
{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:date];
    return currentDateString;
}

// NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string WithFormat:(NSString *)format
{
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    //NSDate转NSString
    NSDate * date = [dateFormatter dateFromString:string];
    
    return [ToolFunctionManager localeDate:date];
}

+ (NSDate *)localeDate:(NSDate *)date {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    
    return localeDate;
}

// 时间戳转日期
+ (NSString*)timeStampTransToDate:(NSTimeInterval)timesp {
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:timesp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];//设置本地时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}

// 时间戳转日期按指定格式
+ (NSString*)timeStampTransToDate:(NSTimeInterval)timesp WithFormat:(NSString *)format {
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:timesp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];//设置本地时区
    [dateFormatter setDateFormat:format];
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}

// 日期转时间戳
+ (NSString*)DateTransToTimeStamp:(NSDate*)date {
    return [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
}

+ (NSString *)getDate:(NSString *)date
{
    long long time=[date longLongValue];
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//格式化
    [df setDateFormat:@"yy-MM-dd HH:mm"];
//    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"] ];
    NSString * timeStr =[df stringFromDate:d];
    return timeStr;
}


// 判断是否为纯数字
+ (BOOL)validateNumber:(NSString *)str {
    BOOL res = YES;
    NSCharacterSet * tempSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (NSInteger i = 0; i < str.length; i ++) {
        NSString * string = [str substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tempSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
    }
    return res;
}


//传入 秒  得到 xx:xx:xx
+ (NSString *)getMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}


//传入 秒  得到 xx:xx:
+ (NSString *)getHHMMFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
//    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_hour,str_minute];
    
    return format_time;
    
}


@end
