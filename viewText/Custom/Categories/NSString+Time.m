//
//  NSString+Time.m
//  CHISLIM
//
//  Created by Mac on 16/12/10.
//  Copyright © 2016年 XIU. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)
+(instancetype)timeDeal:(NSInteger)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    //    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:topicModel.humorDate/1000];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time/1000];
    return [formatter stringFromDate:date];
}




@end
