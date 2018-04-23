//
//  UIFont+SelectFrame.m
//  CHISLIM
//
//  Created by wuhaidong on 2017/8/25.
//  Copyright © 2017年 XIU. All rights reserved.
//

#import "UIFont+SelectFrame.h"

@implementation UIFont (SelectFrame)
+ (UIFont *)selectFontWithSize:(CGFloat)fontSize{
    if (SCREENWIDTH < 375) return [UIFont fontWithName:@"PingFang-SC-Regular" size:fontSize - 1];
    
    if (SCREENWIDTH == 375) return [UIFont fontWithName:@"PingFang-SC-Regular" size:fontSize];
    
    if (SCREENWIDTH > 375) return [UIFont fontWithName:@"PingFang-SC-Regular" size:fontSize + 1];
    
    return [UIFont fontWithName:@"PingFang-SC-Regular" size:fontSize];
}
@end
