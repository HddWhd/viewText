//
//  DJQ_RootTools.m
//  CHISLIM
//
//  Created by wuhaidong on 2017/12/25.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#import "DJQ_RootTools.h"

@implementation DJQ_RootTools
+ (CGSize)adapterSizeWithString:(NSString *)textStr WithMaxWidth:(CGFloat)width WithFont:(UIFont *)font WithLineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    CGRect rect = [textStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle}
                                        context:nil];
    return rect.size;
}
@end
