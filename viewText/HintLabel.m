//
//  HintLabel.m
//  viewText
//
//  Created by wuhaidong on 2018/4/20.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "HintLabel.h"

@interface HintLabel()
@property (nonatomic , strong) UIView *garyView;

@property (nonatomic , strong) UILabel *hitLabel;
@end

@implementation HintLabel

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void) show{
    [self creatWithLabel];
}

- (void) creatWithLabel{
    [self addSubview:self.garyView];
    
    [self.garyView addSubview:self.hitLabel];
}

- (void) setHintString:(NSString *)hintString{
    _hintString = hintString;
}

- (UIView *)garyView{
    if (!_garyView) {
        _garyView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 - 60, self.frame.size.height / 2 - 2.5, 120, 20)];
        
        _garyView.backgroundColor = [UIColor colorWithRed:199 / 255.0f green:199 / 255.0f blue:199 / 255.0f alpha:1];
        
        _garyView.layer.cornerRadius = 5.5;
        
        _garyView.layer.masksToBounds = true;
    }
    return _garyView;
}

- (UILabel *)hitLabel{
    if (!_hitLabel) {
        _hitLabel = [[UILabel alloc]initWithFrame:CGRectMake(7.5, 2, self.garyView.frame.size.width - 15, self.garyView.frame.size.height - 4)];
        
        _hitLabel.font = [UIFont systemFontOfSize:11];
        
        _hitLabel.text = self.hintString.length > 0 ? self.hintString : @"系统提示 : 下注成功";
        
        _hitLabel.textColor = [UIColor whiteColor];
        
        _hitLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hitLabel;
}
@end
