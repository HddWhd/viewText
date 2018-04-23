//
//  ViewText_Define_Header.h
//  viewText
//
//  Created by wuhaidong on 2017/4/20.
//  Copyright © 2017年 wuhaidong. All rights reserved.
//

#ifndef ViewText_Define_Header_h
#define ViewText_Define_Header_h


//user ID
#define MAIN_USERID        [NSString stringWithFormat:@"%@",[GET_NSUSERDEFAULT(DJQ_USER) objectForKey:@"id"]]


#define SCREENWIDTH                       ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT                      ([UIScreen mainScreen].bounds.size.height)

//弱引用
#define WEAKSELF typeof(self) __weak weakSelf = self;

//适配iPhone X
#define  IS_iPhoneX      ((SCREENWIDTH == 375.f && SCREENHEIGHT == 812.f) ? YES : NO)


#define SCREENFRAME                       ([UIScreen mainScreen].bounds)
#define NAVBAR_MARGIN                     (IS_iPhoneX?24.f:0.f)  // 64
#define STATUSBARHEIGHT                   (IS_iPhoneX?44.f:20.f)
#define NAVIGATIONHEIGHT                  (IS_iPhoneX? 88.f:64.f)  //64
#define TABBARHEIGHT                      (IS_iPhoneX?(49.f + 34.f) : 49.f) //49
#define TABBAR_MARGIN                     (IS_iPhoneX?34.f : 0.f)


#define PUSH(v)                           [self.navigationController pushViewController:v animated:YES]
#define SHOW(v)                           [self presentViewController:v animated:YES completion:nil]
#define POP                               [self.navigationController popViewControllerAnimated:YES]
#define DISMISS                           [self dismissViewControllerAnimated:YES completion:nil]
#define POPTOROOTCONTROLLER               [self.navigationController popToRootViewControllerAnimated:YES]

//字体
#define FONT(s)                            [UIFont systemFontOfSize:s]
#define HELVEFONT(s)                       [UIFont fontWithName:@"HelveticaNeue" size:s]
#define RCSFONT(s)                         [UIFont fontWithName:@"Reducto Condensed SSi" size:s]


#define BOLDFONT(s)                       [UIFont boldSystemFontOfSize:s]

#define HEAD_SCALE                        (360 / 750.0)
#define BOTTOM_SCALE                      (435 / 1125.0)
#define SCALE(s)                          ((s) / 375.0 * SCREENWIDTH)

#define SET_NSUSERDEFAULT(k, o)           ([[NSUserDefaults standardUserDefaults] setObject:o forKey:k])
#define GET_NSUSERDEFAULT(k)              ([[NSUserDefaults standardUserDefaults] objectForKey:k])
#define REMOVE_NSUSERDEFAULT(k)           ([[NSUserDefaults standardUserDefaults] removeObjectForKey:k])
#define NSUSERDEFAULT_SYNCHRONIZE         ([[NSUserDefaults standardUserDefaults] synchronize])

#define EMPTY_ARRAY                       ([[NSArray alloc] init])
#define EMPTY_DICTIONARY                  ([[NSDictionary alloc] init])

#define APP_VERSION                       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_NAME                          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

#define POST_NOTIFICATION(n, d)           ([[NSNotificationCenter defaultCenter] postNotificationName:n object:nil userInfo:d])
#define ADD_OBSERVER(v, sel, n)           ([[NSNotificationCenter defaultCenter] addObserver:v selector:@selector(sel) name:n object:nil])
#define REMOVE_NOTIFICATION(v, n)         ([[NSNotificationCenter defaultCenter] removeObserver:v name:n object:nil])

#define TRIM(s)                           ([s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])

#define DEFAULT_AVATAR                    ([UIImage imageNamed:@"default_avatar"])
#define DEFAULT_BGIMAGE                   ([UIImage imageNamed:@"default_picture"])
#define IMAGE(s)                          ([UIImage imageNamed:s])

#define CAN_OPEN_URL(x)                   ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:x]])
#define OPEN_URL(x)                       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:x]])

#define IMAGE_MAX_SIZE                    (200 * 1024)

#define SET_NAV_TEXTATTRIBUTES(f, c)      ([[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:f, NSForegroundColorAttributeName:c}])
#define SET_NAV_HIDDEN(hidden, animate)   ([self.navigationController setNavigationBarHidden:hidden animated:animate])
#define SET_NAV_BARTINTCOLOR(c)           ([self.navigationController.navigationBar setBarTintColor:c])

#define APPLICATION_WINDOW                ([UIApplication sharedApplication].keyWindow)

#define DOCUMENTDIRECTORY_PATH            ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject])

#define DEVICE_VERSION_FLOAT               ([[[UIDevice currentDevice] systemVersion] floatValue])

#endif
