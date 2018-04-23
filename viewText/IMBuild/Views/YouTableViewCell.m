//
//  YouTableViewCell.m
//  viewText
//
//  Created by wuhaidong on 2018/4/20.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "YouTableViewCell.h"
#import "IMDataModel.h"

@interface YouTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *youBasicView;

@property (weak, nonatomic) IBOutlet UIImageView *youRootImage;

@property (weak, nonatomic) IBOutlet UILabel *youContentString;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *youBasicHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *youBasicWidth;

@end

@implementation YouTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void) setModel:(IMDataModel *)model{
    _model = model;
    
    CGSize stringSize = [HD_RootTools adapterSizeWithString:self.youContentString.text WithMaxWidth:128 WithFont:[UIFont systemFontOfSize:16.0f] WithLineSpacing:1];
    
    self.youBasicHeight.constant = stringSize.height > 28 ? stringSize.height + 12 : 40;
    
    self.youBasicWidth.constant = stringSize.width >= 128 ? 140 : stringSize.width + 12;
    
    _model.cellHeight = self.youBasicHeight.constant + 30;
}

@end
