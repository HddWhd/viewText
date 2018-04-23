//
//  IMLogicModel.m
//  viewText
//
//  Created by wuhaidong on 2018/4/23.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import "IMLogicModel.h"

@implementation IMLogicModel
+ (BOOL) hintShowWithSection:(NSInteger )section{//判断是否需要展示提示内容
    switch (section) {
        case 0:
            return true;//需要
            break;
        case 4:
            return false;//不需要
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


@end
