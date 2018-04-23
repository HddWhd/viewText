//
//  ViewText_Header.h
//  viewText
//
//  Created by wuhaidong on 2017/7/23.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#ifndef ViewText_Header_h
#define ViewText_Header_h


// 颜色日志
#define XCODE_COLORS_ESCAPE_MAC @"\033["
#define XCODE_COLORS_ESCAPE_IOS @"\xC2\xA0["
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_MAC
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color
#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,150,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg250,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,235,30;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

// debug log
#if ENABLE_DEBUGLOG == 1
#define APP_DebugLog(FORMAT,...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define APP_DebugLogBlue(...) LogBlue(__VA_ARGS__)
#define APP_DebugLogRed(...) LogRed(__VA_ARGS__)
#define APP_DebugLogGreen(...) LogGreen(__VA_ARGS__)
#else
#define APP_DebugLog(...) do { } while (0);
#define APP_DebugLogBlue(...) do { } while (0);
#define APP_DebugLogRed(...) do { } while (0);
#define APP_DebugLogGreen(...) do { } while (0);
#define APP_Log(...) NSLog(__VA_ARGS__)
#endif

// assert
#if ENABLE_ASSERT_STOP == 1
#define APP_ASSERT_STOP                     {LogRed(@"APP_ASSERT_STOP"); NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);}
#define APP_ASSERT(condition)               {NSAssert(condition, @" ! Assert");}
#else
#define APP_ASSERT_STOP                     do {} while (0);
#define APP_ASSERT(condition)               do {} while (0);
#endif


/////////////////////////////////////////////////////////////////////////////////////
#define IMG(name) [UIImage imageNamed:name]
#define ApplicationDelegate                 (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define SharedApplication                   [UIApplication sharedApplication]
#define WHDefaultCenter                     [NSNotificationCenter defaultCenter]
#define WHCurrCal                           [NSCalendar currentCalendar]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x
#define SelfNavBar                          self.navigationController.navigationBar
#define SelfTabBar                          self.tabBarController.tabBar
#define SelfNavBarHeight                    self.navigationController.navigationBar.bounds.size.height
#define SelfTabBarHeight                    self.tabBarController.tabBar.bounds.size.height
#define ScreenRect                          [[UIScreen mainScreen] bounds]
///屏幕宽度
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
///屏幕高度
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
///当前屏幕基于4.7屏幕比例
#define KMulripleWidth                      ([UIScreen mainScreen].bounds.size.width / 375.f)
#define AdvertisementHeight                 ([UIScreen mainScreen].bounds.size.width * 5 /32 + 19)
#define TouchHeightDefault                  44
#define TouchHeightSmall                    32
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
//#define DATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define TIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define FlushPool(p)                        [p drain]; p = [[NSAutoreleasePool alloc] init]
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define WHSize(w, h)                          CGSizeMake(w, h)
#define WHPoint(x, y)                         CGPointMake(x, y)
#define WHConstraintCoefficientX(x)            (x/375)
#define WHConstraintCoefficientY(y)            (y/667)

#define TabBarHeight                        (ScreenHeight > 736.f ? 82.f : 49.f)
#define NaviBarHeight                       44.0f
#define HeightFor4InchScreen                568.0f
#define HeightFor3p5InchScreen              480.0f
#define NaviBarHeightAndStatus                       64.0f
#define ViewCtrlTopBarHeight                (IsiOS7Later ? (NaviBarHeight + StatusBarHeight) : NaviBarHeight)
#define IsUseIOS7SystemSwipeGoBack          (IsiOS7Later ? YES : NO)

//2013-06-06 by hshimingå
#define IOS8 [[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0
#define IOS10 [[[UIDevice currentDevice] systemVersion] intValue] >= 10.0

#define IPHONE5 SCREEN_HEIGHT-SCREEN_HEIGHT_START> 460


//设备屏幕大小
#define __MainScreenFrame   [[UIScreen mainScreen] bounds]
//设备屏幕宽

#define __MainScreen_Width  __MainScreenFrame.size.width
//设备屏幕高 20,表示状态栏高度.如3.5inch 的高,得到的__MainScreenFrame.size.height是480,而去掉电量那条状态栏,我们真正用到的是460;
///系统TabBar高度
#define ScreenTabBarHeight         ([self.tabBarController.tabBar frame].size.height)
///系统NavigationBar高度
#define ScreenNavigationBarHeight  (self.navigationController.navigationBar.height + 20)
///屏幕高,去除 ,tabber,导航栏
#define ScreenContentHeight (ScreenHeight -(ScreenTabBarHeight + ScreenNavigationBarHeight))
///顶部标题栏的高度
#define TOP_BLANNER_HEIGHT  44

//版本号
#define CURRENTVERSION 1
//版本名称
#define CURRENTVERSIONNAME @"1.0.0"


//////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - app define


#define Is4Inch                                 [UtilityFunc is4InchScreen]

#define RGB_AppWhite                            RGB(252.0f, 252.0f, 252.0f)
#define RGB_TextLightGray                       RGB(200.0f, 200.0f, 200.0f)
#define RGB_TextMidLightGray                    RGB(127.0f, 127.0f, 127.0f)
#define RGB_TextDarkGray                        RGB(100.0f, 100.0f, 100.0f)
#define RGB_TextLightDark                       RGB(50.0f, 50.0f, 50.0f)
#define RGB_TextDark                            RGB(10.0f, 10.0f, 10.0f)
#define RGB_TextAppOrange                       RGB(224.0f, 83.0f, 51.0f)
#define SIZE_TextSmall                          10.0f
#define SIZE_TextContentNormal                  13.0f
#define SIZE_TextTitleMini                      15.0f
#define SIZE_TextTitleNormal                    17.0f
#define SIZE_TextLarge                          16.0f
#define SIZE_TextHuge                           18.0f

#endif

//~~~~~~~~~~~~~~~~~~数据库文件名~~~~~~~~~~~~~~~~~~~~~//
#define databaseFile              @"db.sqlite"
#define databaseName              @"db133.sqlite"
#define sqlite_field_type_text    @"TEXT"     //文本
#define sqlite_field_type_integer @"INTEGER"  //整型
#define sqlite_field_type_null    @"NULL"     //空
#define sqlite_field_type_blob    @"BLOB"     //二进制
#define sqlite_field_type_real    @"REAL"     //浮点型
#define sqlite_field_type_numeric @"NUMERIC"  //数字


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~测试网络的host地址~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
#define networkReachabilityHost @"www.baidu.com"

//~~~~~~~~~~~~~~~~~~~~~登录成功后跳转的目标控制器key~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
#define targetControllerKey          @"targetController"
#define targetControllerReqParamsKey @"targetControllerReqParams"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~保存手机唯一标识的key~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
#define MOBILE_UUID_IDENTIFIER_KEY   @"nache_mobile_uuid_identifier_key"  //保存手机唯一标识的key
#define MOBILE_UUID_IDENTIFIER_GROUP @"nache_mobile_uuid_identifier_group"//保存手机唯一标识的group


//~~~~~~~~~~~~~~~~~~www存放的根目录~~~~~~~~~~~~~~~~~~~~~~~~~//
#define wwwRootDir @"pages/"

//~~~~~~~~~~~~~~~~~~~~~系统定义的颜色~~~~~~~~~~~~~~~~~~~~~~~//
//16进制的颜色
#define hexColorWithAlpha(hexValue,al) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:al]
#define hexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
// 字体颜色
#define RGB_TextColor_C0                      hexColorWithAlpha(0xffffff,1.0)
#define RGB_TextColor_C1                      hexColorWithAlpha(0x3398ff,1.0)
#define RGB_TextColor_C2                      hexColorWithAlpha(0xff8430,1.0)
#define RGB_TextColor_C3                      hexColorWithAlpha(0xedf0f2,1.0)
#define RGB_TextColor_C4                      hexColorWithAlpha(0xdddddd,1.0)
#define RGB_TextColor_C5                      hexColorWithAlpha(0xe3e2e2,1.0)
#define RGB_TextColor_C6                      hexColorWithAlpha(0x777777,1.0)
#define RGB_TextColor_C7                      hexColorWithAlpha(0x333333,1.0)
#define RGB_TextColor_C8                      hexColorWithAlpha(0x999999,1.0)
#define RGB_TextColor_C9                      hexColorWithAlpha(0x000000,1.0)
#define RGB_TextColor_C10                     hexColorWithAlpha(0x4193cd,1.0)
#define RGB_TextColor_C11                     hexColorWithAlpha(0xffffff,1.0)
#define RGB_TextColor_C12                     hexColorWithAlpha(0xfdefba,1.0)
#define RGB_TextColor_C13                     hexColorWithAlpha(0x666666,1.0)
#define RGB_TextColor_C14                     hexColorWithAlpha(0x9e9e9e,1.0)
#define RGB_TextColor_C15                     hexColorWithAlpha(0xc3c3c3,1.0)
#define RGB_TextColor_C16                     hexColorWithAlpha(0x4c4d4f,1.0)
#define RGB_TextColor_C17                     hexColorWithAlpha(0xf94848,1.0)
#define RGB_TextColor_C18                     hexColorWithAlpha(0xffd500,1.0)         //首页按钮边框颜色
// 字体大小
#define FONT_TextSize_S0              [UIFont systemFontOfSize:12]
#define FONT_TextSize_S0_Bold         [UIFont boldSystemFontOfSize:12]
#define FONT_TextSize_S1              [UIFont systemFontOfSize:14]
#define FONT_TextSize_S1_Bold         [UIFont boldSystemFontOfSize:14]
#define FONT_TextSize_S2              [UIFont systemFontOfSize:16]
#define FONT_TextSize_S2_Bold         [UIFont boldSystemFontOfSize:16]
#define FONT_TextSize_S3              [UIFont systemFontOfSize:18]
#define FONT_TextSize_S3_Bold         [UIFont boldSystemFontOfSize:18]
#define FONT_TextSize_S4              [UIFont systemFontOfSize:20]
#define FONT_TextSize_S4_Bold         [UIFont boldSystemFontOfSize:20]
#define FONT_TextSize_S5              [UIFont systemFontOfSize:13]
#define FONT_TextSize_S5_Bold         [UIFont boldSystemFontOfSize:13]
#define FONT_TextSize_S6              [UIFont systemFontOfSize:15]
#define FONT_TextSize_S6_Bold         [UIFont boldSystemFontOfSize:15]
#define FONT_TextSize_S7              [UIFont systemFontOfSize:10]
#define FONT_TextSize_S7_Bold         [UIFont boldSystemFontOfSize:10]
#define FONT_TextSize_S8              [UIFont systemFontOfSize:13]
#define FONT_TextSize_S8_Bold         [UIFont boldSystemFontOfSize:13]
#define FONT_TextSize_S9              [UIFont systemFontOfSize:25]
#define FONT_TextSize_S9_Bold         [UIFont boldSystemFontOfSize:25]
#define FONT_TextSize_S11             [UIFont systemFontOfSize:24]
#define FONT_TextSize_S11_Bold        [UIFont boldSystemFontOfSize:24]
#define FONT_TextSize_S10             [UIFont systemFontOfSize:70]

#define FONT_NavTitleSize_S17         [UIFont boldSystemFontOfSize:17]
//~~~~~~~~~~~~~~~~~~默认的背景色~~~~~~~~~~~~~~~~~~~~~//
#define DEFAULT_BG_COLOR hexColor(0xf6f6f6)
#define kNAV_BG_COLOR    hexColor(0xffffff)

#define HorizontalAccuracy 100

//富文本常用参数
#define font_10_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName, nil]
#define font_09_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:9],NSFontAttributeName, nil]
#define font_12_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:[UIFont systemFontOfSize:12],NSFontAttributeName, nil]
#define color_33_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:hexColor(0x333333),NSForegroundColorAttributeName, nil]
#define color_66_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:hexColor(0x666666),NSForegroundColorAttributeName, nil]
#define color_b2_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:hexColor(0xb2b2b2),NSForegroundColorAttributeName, nil]
#define color_80_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:hexColor(0x808080),NSForegroundColorAttributeName, nil]
#define color_ff_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:hexColor(0xffffff),NSForegroundColorAttributeName, nil]
#define color_half_ff_global_OC [[NSMutableDictionary alloc] initWithObjectsAndKeys:[hexColor(0xffffff) colorWithAlphaComponent:0.5],NSForegroundColorAttributeName, nil]
