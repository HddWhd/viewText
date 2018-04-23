//
//  ZYLWebController.m
//  TestSelf
//
//  Created by wuhaidong on 2017/9/5.
//  Copyright © 2017年 张艺龙. All rights reserved.
//

#import "ZYLWebController.h"

#import "UIView+ReRect.h"
#import "UIImage+Exten.h"
#import "UIColor+HexString.h"

@interface ZYLWebController () <WKNavigationDelegate>

@property (strong, nonatomic) WKWebView * webView;
@property (strong, nonatomic) NSMutableURLRequest * request;
@property (strong, nonatomic) NSMutableDictionary * queryDic;


@property (strong, nonatomic) NSMutableArray * sharesArray;

@property (nonatomic,strong) NSString  *shareUrl;


@end

@implementation ZYLWebController

- (instancetype)initWithUrl:(NSString *)url {
    if (self = [super init]) {
        self.shareUrl = url;
        self.request.URL = [NSURL URLWithString:url];
        [self.webView loadRequest:self.request];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 关闭Controller自动计算高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self _initData];
//    [self _initBackItem];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self _initBackItem];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.showShare) {
        [self _initShareButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)_initData {
    self.showShare = NO;
}

-(void)_initBackItem{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self  createNavBtnByTitle:nil  icon:@"nav_back" action:@selector(_backAction)]];

}
// 设置Web页面的返回按钮 (带关闭)
- (void)_initWebBackButton {

     UIButton *backItem = [UIButton buttonWithType:UIButtonTypeCustom];
     [backItem setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
     [backItem setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
//    [backItem setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
     [backItem setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
     [backItem sizeToFit];
     backItem.frame = CGRectMake(0,0,CGRectGetWidth(backItem.frame) ,40);
     [backItem addTarget:self action:@selector(_backAction) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem* itemBack = [[UIBarButtonItem alloc]initWithCustomView:backItem];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitle:@"关闭" forState:UIControlStateHighlighted];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    closeBtn.titleLabel.font = HELVEFONT(16);
    [closeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [closeBtn sizeToFit];
    closeBtn.frame = CGRectMake(0,0,CGRectGetWidth(backItem.frame) ,40);

    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:closeBtn];
    [closeBtn addTarget:self action:@selector(_closeAction) forControlEvents:UIControlEventTouchUpInside];

    item.tintColor = hexColor(0x333333);
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    self.navigationItem.leftBarButtonItems = @[itemBack, item, spaceItem];
}

// 设置分享按钮
- (void)_initShareButton {
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[self  createNavBtnByTitle:@"分享" icon:nil action:@selector(_shareAction)]];
    
}

 
#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // 请求完成
    self.navigationItem.title = webView.title;
    if ([self.webView canGoBack]) {
        [self _initWebBackButton ];
    }
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    // 已经开始请求
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    // 请求之前 获取私有协议头
    NSString * scheme = [navigationAction.request.URL scheme];
    // 判断协议头是否为私有协议头
    if ([scheme isEqualToString:@"dongjiquan"]) {
        // 取消跳转
        decisionHandler(WKNavigationActionPolicyCancel);
        /*
         * 可自定义执行操作
         */
        // "://"之后, "?"之前的部分 判断, 需要执行的方法
        NSString * host = [navigationAction.request.URL host];
//        NSLog(@"%@", host);
       
        // url中参数部分
        NSString * query = [navigationAction.request.URL query];
//        NSLog(@"------------------------%@", query);
        // 解析参数
        [self _parseParameters:query];
        
        
        if ([host isEqualToString:@"GoToMatch"]) {
//           [self toGoMLSGCMatch];
        }
       
    }else {
        // 允许跳转
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}


#pragma mark - Actions
////个人常规马拉松
//- (void)toGoMLSGCMatch {
//    ChangeRuleTypeVC *vc = [[ChangeRuleTypeVC alloc]init];
//    PUSH(vc);
//}
//
//- (void)_shareAction {
//    [UMSocialUIManager setPreDefinePlatforms:self.sharesArray];
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//        // 根据获取的platformType确定所选平台进行下一步操作
//
//        if (_shareUrlStr.length != 0 ) {
//            self.shareUrl = _shareUrlStr ;
//        }
//        [self shareImageWithPlatformType:platformType withUrl:self.shareUrl];
//    }];
//}
//返回事件
- (void)_backAction {
       if (self.backToRoot) {
           
          POPTOROOTCONTROLLER ;
      }else{
          if ([self.webView canGoBack]) {
              [self.webView goBack];
          }else {
              POP;
          }
      }
}

- (void)_closeAction {
    
    if (self.backToRoot) {
        POPTOROOTCONTROLLER ;
    }else{
        POP;
    }
}

- (void)_parseParameters:(NSString *)query {
    self.queryDic = nil;
    NSArray * queryArr = [query componentsSeparatedByString:@"&"];
    for (NSString * queryKeyValue in queryArr) {
        NSArray * queryItemArr = [queryKeyValue componentsSeparatedByString:@"="];
        [self.queryDic setObject:[queryItemArr lastObject] forKey:[queryItemArr firstObject]];
    }
}


//- (void)shareImageWithPlatformType:(UMSocialPlatformType)platformType withUrl:(NSString *)url {
//
//    //分享的url 添加参数
//
//    NSString *newUrl = [NSString stringWithFormat:@"%@&shareJudge=y",url];
//
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    //创建网页内容对象
//    NSString *shareTitle = self.webView.title;
//
//    if (self.shareTitleStr.length != 0){
//        shareTitle = self.shareTitleStr;
//    }
//
//
//    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareTitle descr:@"东极圈，跑出不一样的自己\n启迈斯为您助跑!" thumImage:[UIImage imageNamed:@"lp_login_logo"]];
//
//    //设置网页地址
//    shareObject.webpageUrl = newUrl;
//
//    //分享消息对象设置分享内容对象
//    messageObject.shareObject = shareObject;
//
//    //调用分享接口
//    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//        if (error) {
//            [QMSProgressHUD showTextProgressHUD:APPLICATION_WINDOW withText:@"分享失败"];
//            //            NSLog(@"************Share fail with error %@*********",error);
//        }else{
//            //            NSLog(@"response data is %@",data);
//        }
//    }];
//
//}

#pragma mark - Get

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, NAVIGATIONHEIGHT, SCREENWIDTH, SCREENHEIGHT - NAVIGATIONHEIGHT)];
        _webView.backgroundColor = RGB_AppWhite;
        _webView.navigationDelegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (NSMutableURLRequest *)request {
    if (!_request) {
        _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@""]];
    }
    return _request;
}

- (NSMutableDictionary *)queryDic {
    if (!_queryDic) {
        _queryDic = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return _queryDic;
}



- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

//- (NSMutableArray *)sharesArray{
//
//    if (!_sharesArray) {
//
//        _sharesArray = [[NSMutableArray alloc]init];
//        if ( [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina]) {
//            [_sharesArray addObject:@(UMSocialPlatformType_Sina)];
//        }
//        if ( [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
//            [_sharesArray addObject:@(UMSocialPlatformType_QQ)];
//            [_sharesArray addObject:@(UMSocialPlatformType_Qzone)];
//        }
//        if ( [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
//            [_sharesArray addObject:@(UMSocialPlatformType_WechatSession)];
//            [_sharesArray addObject:@(UMSocialPlatformType_WechatTimeLine)];
//        }
//
//    }
//    return _sharesArray;
//}

@end
