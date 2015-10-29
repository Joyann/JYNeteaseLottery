//
//  JYSettingModel.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/29.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYSettingModel.h"

@implementation JYSettingModel

+ (instancetype)modelWithTitle:(NSString *)title image:(UIImage *)image type:(JYSettingModelType)type
{
    JYSettingModel *model = [[JYSettingModel alloc] init];
    model.title = title;
    model.image = image;
    model.type = type;
    return model;
}

@end
