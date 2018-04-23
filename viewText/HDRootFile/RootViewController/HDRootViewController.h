//
//  HDRootViewController.h
//  
//
//  Created by wuhaidong on 2016/12/4.
//  Copyright © 2016年 wuhaidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRootViewController : UIViewController

/**
 naviGationRightBtn
 */
@property (nonatomic , strong) UIButton *basicRootBtn;

/**
 导航栏视图
 */
@property (nonatomic , strong) UIView *naviView;

/**
 是否需要创建TableView 默认为false
 */
@property (nonatomic , assign) BOOL isSetUP;

@property (nonatomic , strong) NSMutableArray *helps;

/**
右侧NaviGation按钮距离调整

 @param space 距离 (输入绝对值)
返回当前空白的View
 */
- (UIBarButtonItem *) naviGationRightWithSpace:(CGFloat )space;


//导航左右按键
- (UIButton *)createNavBtnByTitle:(NSString *)title icon:(NSString *)icon action:(SEL) action;
@end
