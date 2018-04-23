//
//  QMSFunctionManager.h
//  QiMaiSi
//
//  Created by wuhaidong on 2017/7/18.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolFunctionManager : NSObject

+ (NSDate *)localeDate:(NSDate *)date;

// NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date WithFormat:(NSString *)format;
// NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string WithFormat:(NSString *)format;

// 时间戳转日期
+ (NSString*)timeStampTransToDate:(NSTimeInterval)timesp;
// 时间戳转日期按指定格式
+ (NSString*)timeStampTransToDate:(NSTimeInterval)timesp WithFormat:(NSString *)format;
// 日期转时间戳
+ (NSString*)DateTransToTimeStamp:(NSDate*)date;

+ (NSString *)getDate:(NSString *)date;

// 判断是否为纯数字
+ (BOOL)validateNumber:(NSString *)str;

//传入秒数得到时分秒
+ (NSString *)getMMSSFromSS:(NSString *)totalTime;

//传入 秒  得到 时分
+ (NSString *)getHHMMFromSS:(NSString *)totalTime;

@end
