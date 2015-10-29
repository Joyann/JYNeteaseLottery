//
//  JYConfigViewController.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/29.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYConfigViewController.h"
#import "JYSection.h"
#import "JYSettingModel.h"
#import <UIKit/UIKit.h>

@interface JYConfigViewController ()

@end

@implementation JYConfigViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpModel];
}

#pragma mark - Set Up Model

- (void)setUpModel
{
    // 创建第一个section的模型
    JYSection *exchangeSection = [[JYSection alloc] init];
    
    JYSettingModel *exchangeModel = [JYSettingModel modelWithTitle:@"使用兑换码" image:[UIImage imageNamed:@"exchange"] type:JYSettingModelTypeArrow];
    
    exchangeSection.models = @[exchangeModel];
    
    // 创建第二个section的模型
    JYSection *pushSection = [[JYSection alloc] init];
    
    JYSettingModel *pushModel = [JYSettingModel modelWithTitle:@"推送和提醒" image:[UIImage imageNamed:@"push"] type:JYSettingModelTypeArrow];
    JYSettingModel *shakeModel = [JYSettingModel modelWithTitle:@"摇一摇机选" image:[UIImage imageNamed:@"shake"] type:JYSettingModelTypeSwitch];
    JYSettingModel *soudEffectModel = [JYSettingModel modelWithTitle:@"声音效果" image:[UIImage imageNamed:@"sound_effect"] type:JYSettingModelTypeSwitch];
    JYSettingModel *wifiLoadModel = [JYSettingModel modelWithTitle:@"圈子仅Wifi加载图片" image:[UIImage imageNamed:@"wifi_load"] type:JYSettingModelTypeSwitch];
    
    pushSection.models = @[pushModel, shakeModel, soudEffectModel, wifiLoadModel];
    
    // 创建第三个section的模型
    JYSection *aboutSection = [[JYSection alloc] init];
    
    JYSettingModel *shareModel = [JYSettingModel modelWithTitle:@"推荐给朋友" image:[UIImage imageNamed:@"share"] type:JYSettingModelTypeArrow];
    JYSettingModel *introModel = [JYSettingModel modelWithTitle:@"产品推荐" image:[UIImage imageNamed:@"netease"] type:JYSettingModelTypeArrow];
    JYSettingModel *aboutModel = [JYSettingModel modelWithTitle:@"关于" image:[UIImage imageNamed:@"about"] type:JYSettingModelTypeArrow];
    
    aboutSection.models = @[shareModel, introModel, aboutModel];
    
    self.sections = @[exchangeSection, pushSection, aboutSection];
}



@end
