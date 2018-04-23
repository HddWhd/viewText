//
//  HDRootViewController.m
//  
//
//  Created by wuhaidong on 2016/12/4.
//  Copyright © 2016年 wuhaidong. All rights reserved.
//

#import "HDRootViewController.h"
#import <objc/runtime.h>

@interface HDRootViewController ()

@end

@implementation HDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = hexColor(0xf4f5f9);
    
    //当设置为YES时（默认YES），如果视图里面存在唯一一个UIScrollView或其子类View，那么它会自动设置相应的内边距，这样可以让scroll占据整个视图，又不会让导航栏遮盖
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    if (self.djquser.id == nil || self.djquser.id.length == 0 ) {
//        if (![self.navigationController isEqual:[self getPresentedViewController]]) {
//            NewLoginVC *vc = [[NewLoginVC alloc]init];
//            
//            UINavigationController *logVc = [[UINavigationController alloc]initWithRootViewController:vc];
//            
//            SHOW(logVc);
//        }
//    }
}

+ (void) load{
    Method HDNaviBarViewDidAppear = class_getInstanceMethod([self class], @selector(HDViewWillAppear:));
    
    Method OldNaviBarViewDidAppear = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    
    method_exchangeImplementations(HDNaviBarViewDidAppear, OldNaviBarViewDidAppear);
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void) TextViewWillAppear:(BOOL)animated{
    [self TextViewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"ffffff"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                            style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UIFont *font = HELVEFONT(16);
    
    NSDictionary *dic = @{NSFontAttributeName:font,
                          NSForegroundColorAttributeName: hexColor(0x1a1a1a)};
    
    self.navigationController.navigationBar.titleTextAttributes =dic;
}

- (UIBarButtonItem *) naviGationRightWithSpace:(CGFloat )space{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    negativeSpacer.width = -space;
    
    return negativeSpacer;
}


//导航左右按键
- (UIButton *)createNavBtnByTitle:(NSString *)title icon:(NSString *)icon action:(SEL) action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = HELVEFONT(16);
    }
    if(icon) {
        [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateHighlighted];
        if(title) {
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        }
    }
    [btn sizeToFit];
    btn.frame = CGRectMake(0,0,CGRectGetWidth(btn.frame) ,40);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
#pragma mark - Get

//-(User *)djquser{
//    if (!_djquser) {
//        NSDictionary * user = GET_NSUSERDEFAULT(DJQ_USER);
////        NSUSERDEFAULT_SYNCHRONIZE;
//        _djquser = [User mj_objectWithKeyValues:user];
//    }
//    return _djquser;
//}
//
//
//-(NSMutableArray *)helps{
//    if (_helps == nil) {
//        //得到文件路径
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"json"];
//        //使用NSData来接受数据
//        NSData *data = [NSData dataWithContentsOfFile:path];
//        //得到字典数组,第二个参数枚举值表示加载出来的数组是可变的
//        NSArray *helpArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
//
//        _helps = [NSMutableArray new];
//
//        for (NSDictionary *dic in helpArray) {
//
//            QMS_AllLIstModel *model = [[QMS_AllLIstModel alloc]init];
//
//            model = [model mj_setKeyValues:dic];
//
//            [_helps addObject:model];
//        }
//    }
//    return _helps;
//}

- (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}

@end
