//
//  JYSettingModel.h
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/29.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, JYSettingModelType){
    JYSettingModelTypeArrow,
    JYSettingModelTypeSwitch,
    JYSettingModelTypeNone
};

@interface JYSettingModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) JYSettingModelType type;

+ (instancetype)modelWithTitle: (NSString *)title image: (UIImage *)image type: (JYSettingModelType)type;

@end
