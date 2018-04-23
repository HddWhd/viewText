//
//  HeadView.m
//  viewText
//
//  Created by wuhaidong on 2018/4/20.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "HeadView.h"

@interface HeadView()
@property (nonatomic , strong) UILabel *timeLabel;

@property (nonatomic , strong) UILabel *dateLabel;

@property (nonatomic , strong) UIButton *nextButton;
@end

@implementation HeadView
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self creatView];
    }
    return self;
}

- (UILabel *) timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(12, self.frame.size.height / 2 - 6, 115, 12)];
        
        _timeLabel.textColor = [UIColor colorWithRed:235 / 255.0f green:101 / 255.0f blue:101 / 255.0f alpha:1];
        
        _timeLabel.font = [UIFont systemFontOfSize:12.0f];
        
        _timeLabel.text = @"第867396下注截止";
    }
    return _timeLabel;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 - 28, self.frame.size.height / 2 - 6, 56, 12)];
        
        _dateLabel.textColor = [UIColor colorWithRed:235 / 255.0f green:101 / 255.0f blue:101 / 255.0f alpha:1];
        
        _dateLabel.font = [UIFont systemFontOfSize:12.0f];
        
        _dateLabel.text = @"3分28秒";
    }
    return _dateLabel;
}

- (UIButton *)nextButton{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _nextButton.frame = CGRectMake(self.frame.size.width - 99, self.frame.size.height / 2 - 6, 87, 12);
        
        [_nextButton setTitle:@"本期已投注(1)" forState:UIControlStateNormal];
        
        [_nextButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        
        [_nextButton setTitleColor:[UIColor colorWithRed:235 / 255.0f green:101 / 255.0f blue:101 / 255.0f alpha:1] forState:UIControlStateNormal];
        
        [_nextButton addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (void) creatView{
    
    self.backgroundColor = [UIColor colorWithRed:252 / 255.0f green:247 / 255.0f blue:247 / 255.0f alpha:1];
    
    [self addSubview:self.timeLabel];
    
    [self addSubview:self.dateLabel];
    
    [self addSubview:self.nextButton];
    
}

- (void) nextClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(nextClick)]) {
        [self.delegate nextClick];
    }
}


@end
