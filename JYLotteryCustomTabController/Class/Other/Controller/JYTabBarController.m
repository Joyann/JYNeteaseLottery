//
//  JYTabBarController.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/28.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYTabBarController.h"
#import "JYHallViewController.h"
#import "JYBattleViewController.h"
#import "JYDiscoveryViewController.h"
#import "JYAwardViewController.h"
#import "JYMineViewController.h"
#import "JYNavigationController.h"
#import "JYTabBar.h"
#import "JYTabBarButton.h"

@interface JYTabBarController () <JYTabBarDelegate>

@end

@implementation JYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addChildViewControllers];
    
    [self addTabBarAndTabBarItems];
    
    self.tabBar.translucent = NO;
}

#pragma mark - Add Tab Bar

- (void)addTabBarAndTabBarItems
{
    JYTabBar *tabBar = [[JYTabBar alloc] initWithFrame:self.tabBar.bounds];
    [self.tabBar addSubview:tabBar];
    
    // 将系统自带的tabBarItem禁用，否则不能点击自定义tabBar上的按钮
    self.tabBarItem.enabled = NO;
    
    tabBar.delegate = self;
    
    for (int i = 1; i <= 5; i++) {
        [tabBar addTabBarItemWithImageName:[NSString stringWithFormat:@"tab0%d", i] selectedImageName:[NSString stringWithFormat:@"tab0%dSel", i]];
    }
    
    [tabBar adjustItemsFrame];
}

#pragma mark - Add Child View Controllers

- (void)addChildViewControllers
{
    JYHallViewController *hallVC = [[JYHallViewController alloc] init];
    hallVC.view.backgroundColor = [UIColor redColor];
    [self addViewContoller:hallVC];
    
    JYBattleViewController *battleVC = [[JYBattleViewController alloc] init];
    battleVC.view.backgroundColor = [UIColor greenColor];
    [self addViewContoller:battleVC];
    
    JYDiscoveryViewController *discoveryVC = [[JYDiscoveryViewController alloc] init];
    discoveryVC.view.backgroundColor = [UIColor lightGrayColor];
    [self addViewContoller:discoveryVC];
    
    JYAwardViewController *awardVC = [[JYAwardViewController alloc] init];
    awardVC.view.backgroundColor = [UIColor orangeColor];
    [self addViewContoller:awardVC];
    
    JYMineViewController *mineVC = [[JYMineViewController alloc] init];
    mineVC.view.backgroundColor = [UIColor whiteColor];
    [self addViewContoller:mineVC];
}

#pragma mark - Helper Methods

- (void)addViewContoller: (UIViewController *)vc
{
    JYNavigationController *navigationController = [[JYNavigationController alloc] initWithRootViewController:vc];
    navigationController.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:navigationController];
    
    // 将系统自带的navigationItem禁用，否则无法点击自定义tabBar上的按钮
    navigationController.tabBarItem.enabled = NO;
}

#pragma mark - JYTabBarDelegate

- (void)tabBar:(JYTabBar *)tabBar didSelectItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    [self setSelectedIndex:toIndex];
}

@end
