//
//  DJQ_RootTools.h
//  CHISLIM
//
//  Created by wuhaidong on 2017/12/25.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJQ_RootTools : NSObject
+ (CGSize)adapterSizeWithString:(NSString *)textStr WithMaxWidth:(CGFloat)width WithFont:(UIFont *)font WithLineSpacing:(CGFloat)lineSpacing;
@end
