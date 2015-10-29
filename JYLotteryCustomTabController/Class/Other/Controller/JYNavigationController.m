//
//  JYNavigationController.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/28.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYNavigationController.h"

@interface JYNavigationController ()

@end

@implementation JYNavigationController

+ (void)initialize
{
    [super initialize];
    
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbar64"] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

@end
