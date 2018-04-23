//
//  IMLogicModel.h
//  viewText
//
//  Created by wuhaidong on 2018/4/23.
//  Copyright © 2018年 wuhaidong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {//枚举判断展示回复或接受的cell
    IMTableViewCellStyleLeft,
    IMTableViewCellStyleRight,
} IMTableViewCellStyle;

@interface IMLogicModel : NSObject
+ (BOOL) hintShowWithSection:(NSInteger )section;//是否展示提示内容

+ (IMTableViewCellStyle )IMTableViewCellStyleWithCand:(NSInteger )section;//返回left or right
@end
