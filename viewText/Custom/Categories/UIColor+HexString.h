//
//  UIColor+HexString.h
//  QiMaiSi
//
//  Created by wuhaidong on 2017/3/14.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

// 使用十六进制颜色值
+ (UIColor *)colorWithHexString:(NSString *)hexString;


//随机色
+ (UIColor *)randomColor;

@end
