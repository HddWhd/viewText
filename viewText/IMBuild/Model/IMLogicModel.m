//
//  IMLogicModel.m
//  viewText
//
//  Created by wuhaidong on 2018/4/23.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "IMLogicModel.h"
#import "IMDataModel.h"

@interface IMLogicModel()

@end

@implementation IMLogicModel
+ (BOOL) hintShowWithSection:(NSInteger )section{//判断是否需要展示提示内容
    switch (section) {
        case 0:
            return false;//需要
            break;
        case 4:
            return true;//不需要
            break;
            
        default:
            return false;//默认不需要
            break;
    }
}

+ (IMTableViewCellStyle) IMTableViewCellStyleWithCand:(NSInteger )section{
        switch (section) {
            case 0:
                return IMTableViewCellStyleLeft;
                break;
            case 1:
                return IMTableViewCellStyleLeft;
                break;
            case 2:
                return IMTableViewCellStyleLeft;
                break;
            case 3:
                return IMTableViewCellStyleRight;
                break;
            case 4:
                return IMTableViewCellStyleLeft;
                break;
            default:
                return IMTableViewCellStyleRight;
                break;
        }
}

//网络请求类~现在无 模拟数据
+ (NSMutableArray<IMDataModel *> *)urlWithCellHeight:(CGFloat )height{
    NSMutableArray *dataModelArray = [NSMutableArray array];
    
    for (int i = 0 ; i < 5; i ++) {
        IMDataModel *model = [[IMDataModel alloc]init];
        
        model.cellHeight = height;
        
        [dataModelArray addObject:model];
    }

    return dataModelArray;
}

@end
