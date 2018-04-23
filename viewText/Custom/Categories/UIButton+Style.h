//
//  UIButton+Style.h
//  CHISLIM
//
//  Created by wuhaidong on 2017/8/25.
//  Copyright © 2017年 XIU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HDButtonEdgeInsetsStyle) {
    HDButtonEdgeInsetsStyleTop, // image在上，label在下
    HDButtonEdgeInsetsStyleLeft, // image在左，label在右
    HDButtonEdgeInsetsStyleBottom, // image在下，label在上
    HDButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (Style)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(HDButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end
