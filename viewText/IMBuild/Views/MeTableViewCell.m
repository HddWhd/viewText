//
//  MeTableViewCell.m
//  viewText
//
//  Created by wuhaidong on 2018/4/20.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "MeTableViewCell.h"
#import "IMDataModel.h"

@interface MeTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *basicView;

@property (weak, nonatomic) IBOutlet UILabel *contentString;

@property (weak, nonatomic) IBOutlet UIImageView *rootImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *basicWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *basicHeight;

@end

@implementation MeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void) setModel:(IMDataModel *)model{
    _model = model;
    
    CGSize stringSize = [HD_RootTools adapterSizeWithString:self.contentString.text WithMaxWidth:128 WithFont:[UIFont systemFontOfSize:16.0f] WithLineSpacing:1];
    
    self.basicHeight.constant = stringSize.height > 28 ? stringSize.height + 12 : 40;
    
    self.basicWidth.constant = stringSize.width >= 128 ? 140 : stringSize.width + 12;
    
    _model.cellHeight = self.basicHeight.constant + 30;
}

@end
