//
//  JYSection.h
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/29.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYSection : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, strong) NSArray *models;
@property (nonatomic, copy) NSString *footer;

@end
