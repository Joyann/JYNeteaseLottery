//
//  JYTabBar.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/28.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYTabBar.h"
#import "JYTabBarButton.h"

@interface JYTabBar ()
@property (nonatomic, weak) JYTabBarButton *preButton;
@end

@implementation JYTabBar

#pragma mark - Add Tab Bar Items

- (void)addTabBarItemWithImageName: (NSString *)imageName selectedImageName: (NSString *)selectedImageName
{
    JYTabBarButton *button = [[JYTabBarButton alloc] init];
    button.backgroundColor = [UIColor blackColor];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(handleTabBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

#pragma mark - Handle Tab Bar Item Click

- (void)handleTabBarItemClick: (JYTabBarButton *)button
{
    button.selected = YES;
    
    if (self.preButton != button) {
        self.preButton.selected = NO;
    }
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItemFromIndex:toIndex:)]) {
        [self.delegate tabBar:self didSelectItemFromIndex:self.preButton.tag toIndex:button.tag];
    }
    
    self.preButton = button;
    
}

#pragma mark - Adjust Items Frame

- (void)adjustItemsFrame
{
    NSInteger itemsCount = self.subviews.count;
    CGFloat itemW = self.bounds.size.width / itemsCount;
    CGFloat itemH = self.bounds.size.height;
    CGFloat itemX = 0;
    CGFloat itemY = 0;
    for (int i = 0; i < itemsCount; i++) {
        itemX = i * itemW;
        CGRect frame = CGRectMake(itemX, itemY, itemW, itemH);
        JYTabBarButton *button = self.subviews[i];
        button.frame = frame;
        button.tag = i;
        
        if (button.tag == 0) {
            button.selected = YES;
            self.preButton = button;
        }
    }
}

@end
