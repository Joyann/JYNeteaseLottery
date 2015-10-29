//
//  JYConfigTableViewCell.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/29.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYConfigTableViewCell.h"
#import "JYSettingModel.h"

@interface JYConfigTableViewCell ()
@property (nonatomic, strong) UISwitch *switchButton;
@end

@implementation JYConfigTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        self.selectedBackgroundView = view;
    }
    return self;
}

- (UISwitch *)switchButton
{
    if (!_switchButton) {
        _switchButton = [[UISwitch alloc] init];
    }
    return _switchButton;
}

- (void)setModel:(JYSettingModel *)model
{
    self.imageView.image = model.image;
    self.textLabel.text = model.title;
    switch (model.type) {
        case JYSettingModelTypeArrow:
        {
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case JYSettingModelTypeSwitch:
        {
            self.accessoryView = self.switchButton;
            break;
        }
        case JYSettingModelTypeNone:
        {
            self.accessoryType = UITableViewCellAccessoryNone;
            self.accessoryView = nil;
            break;
        }
            
        default:
            break;
    }
}

@end
