//
//  ZYLWebController.h
//  TestSelf
//
//  Created by wuhaidong on 2017/9/5.
//  Copyright © 2017年 张艺龙. All rights reserved.
//

#import "HDRootViewController.h"
#import <WebKit/WebKit.h>

@interface ZYLWebController : HDRootViewController


/** 分享标题   选填*/
@property (nonatomic,strong)  NSString * shareTitleStr;

/** 分享的url 选填 */
@property (nonatomic,strong)  NSString * shareUrlStr;




/** 是否展示分享 */
@property (nonatomic,assign) BOOL showShare;

/** 是否返回到rootVC */
@property (nonatomic,assign) BOOL backToRoot;

- (instancetype)initWithUrl:(NSString *)url;

@property (nonatomic , strong) NSString *overTitle;//团队马拉松结束后弹窗的title




@end
