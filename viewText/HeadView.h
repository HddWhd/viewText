//
//  HeadView.h
//  viewText
//
//  Created by wuhaidong on 2018/4/20.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelegate <NSObject>

@optional

-(void) nextClick;

@end

@interface HeadView : UIView

- (void) creatView;

@property (nonatomic , assign) id<HeadViewDelegate> delegate;

@end
