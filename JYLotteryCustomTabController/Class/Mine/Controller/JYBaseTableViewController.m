
//
//  JYBaseTableViewController.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/29.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYBaseTableViewController.h"
#import "JYSection.h"
#import "JYConfigTableViewCell.h"

static NSString * const JYTableViewCellIdentifier = @"JYTableViewCellIdentifier";

@interface JYBaseTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation JYBaseTableViewController

#pragma mark - View Controlelr Life Cycle

- (instancetype)init
{
    if(self = [super init]) {
        [self addTableView];
        [self setBackgroundImage];
        [self setUpTableView];
    }
    return self;
}

#pragma mark - Set Up Table View

- (void)setUpTableView
{
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}


#pragma mark - Set Background Image

- (void)setBackgroundImage
{
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]]];
}

#pragma mark - Add Table View

- (void)addTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    JYSection *sectionModel = self.sections[section];
    return sectionModel.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYConfigTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JYTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[JYConfigTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:JYTableViewCellIdentifier];
    }
    JYSection *sectionModel = self.sections[indexPath.section];
    JYSettingModel *model = sectionModel.models[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
