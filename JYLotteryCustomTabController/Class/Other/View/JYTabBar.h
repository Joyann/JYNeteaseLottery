//
//  JYTabBar.h
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/28.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYTabBar;

@protocol JYTabBarDelegate <NSObject>

- (void)tabBar: (JYTabBar *)tabBar didSelectItemFromIndex: (NSInteger)fromIndex toIndex: (NSInteger)toIndex;

@end

@interface JYTabBar : UIView

@property (nonatomic, weak) id<JYTabBarDelegate> delegate;

- (void)addTabBarItemWithImageName: (NSString *)imageName selectedImageName: (NSString *)selectedImageName;

- (void)adjustItemsFrame;

@end
