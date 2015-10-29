//
//  JYMineViewController.m
//  JYLotteryCustomTabController
//
//  Created by joyann on 15/10/28.
//  Copyright © 2015年 Joyann. All rights reserved.
//

#import "JYMineViewController.h"
#import "Masonry.h"
#import "JYConfigViewController.h"

@interface JYMineViewController ()
@property (nonatomic, strong) UIImageView *adImageView;
@property (nonatomic, strong) UILabel *loginLabel;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UILabel *otherLabel;
@property (nonatomic, strong) UIButton *wechatButton;
@property (nonatomic, strong) UIButton *qqButton;
@end

@implementation JYMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setBarButtonItems];
    [self setBarButtonItemAppearence];
    
    [self addSubviews];
    [self addConstrains];
}

#pragma mark - Set Bar Button Items

- (void)setBarButtonItems
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"客服" style:UIBarButtonItemStylePlain target:self action:@selector(handleLeftBarButtonClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(handleRightBarButtonClick:)];
}

#pragma mark - Handle Bar Button Click

- (void)handleLeftBarButtonClick: (UIBarButtonItem *)button
{
    
}

- (void)handleRightBarButtonClick: (UIBarButtonItem *)button
{
    JYConfigViewController *configVC = [[JYConfigViewController alloc] init];
    configVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:configVC animated:YES];
}

#pragma mark - Set Bar Button Item Appearence

- (void)setBarButtonItemAppearence
{
    NSDictionary *attributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor] };
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
}

#pragma mark - Lazy Load Methods

- (UIImageView *)adImageView
{
    if (!_adImageView) {
        _adImageView = [[UIImageView alloc] init];
        _adImageView.image = [UIImage imageNamed:@"loginscreen"];
        _adImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _adImageView;
}

- (UILabel *)loginLabel
{
    if (!_loginLabel) {
        _loginLabel = [[UILabel alloc] init];
        _loginLabel.text = @"网易邮箱账号可直接登录";
        _loginLabel.font = [UIFont systemFontOfSize:14.0];
        _loginLabel.textColor = [UIColor redColor];
        _loginLabel.alpha = 0.5;
    }
    return _loginLabel;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *buttonImage = [UIImage imageNamed:@"redbutton"];
        buttonImage = [buttonImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        UIImage *selButtonImage = [UIImage imageNamed:@"redbutton_highlight"];
        selButtonImage = [selButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        [_loginButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:selButtonImage forState:UIControlStateHighlighted];
        
        [_loginButton setTitle:@"登  录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_loginButton setTintColor:[UIColor whiteColor]];
    }
    return _loginButton;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        NSString *text = @"没有账号？快速注册 >";
        _registerButton = [[UIButton alloc] init];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_registerButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _registerButton.titleLabel.alpha = 0.5;
        
        NSDictionary *attributes = @{ NSForegroundColorAttributeName: [UIColor blueColor]};
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
        NSRange range = [text rangeOfString:@"快速注册 >"];
        [attributeString setAttributes:attributes range:range];
        [_registerButton setAttributedTitle:attributeString forState:UIControlStateNormal];
    }
    return _registerButton;
}

- (UILabel *)otherLabel
{
    if (!_otherLabel) {
        _otherLabel = [[UILabel alloc] init];
        _otherLabel.text = @"使用其他账号登录";
        _otherLabel.textColor = [UIColor redColor];
        _otherLabel.font = [UIFont systemFontOfSize:14.0];
        _otherLabel.alpha = 0.5;
    }
    return _otherLabel;
}

- (UIButton *)wechatButton
{
    if (!_wechatButton) {
        _wechatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wechatButton setBackgroundImage:[UIImage imageNamed:@"whitebutton"] forState:UIControlStateNormal];
        [_wechatButton setBackgroundImage:[UIImage imageNamed:@"whitebutton_highlight"] forState:UIControlStateHighlighted];
        [_wechatButton setTitle:@"微信登录" forState:UIControlStateNormal];
        _wechatButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_wechatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _wechatButton.titleLabel.alpha = 0.5;
    }
    return _wechatButton;
}

- (UIButton *)qqButton
{
    if (!_qqButton) {
        _qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqButton setBackgroundImage:[UIImage imageNamed:@"whitebutton"] forState:UIControlStateNormal];
        [_qqButton setBackgroundImage:[UIImage imageNamed:@"whitebutton_highlight"] forState:UIControlStateHighlighted];
        [_qqButton setTitle:@"QQ登录" forState:UIControlStateNormal];
        _qqButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_qqButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _qqButton.titleLabel.alpha = 0.5;
    }
    return _qqButton;
}

#pragma mark - Add Subviews

- (void)addSubviews
{
    [self.view addSubview:self.adImageView];
    [self.view addSubview:self.loginLabel];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.otherLabel];
    [self.view addSubview:self.wechatButton];
    [self.view addSubview:self.qqButton];
}

#pragma mark - Add Constrains

- (void)addConstrains
{
    // adImageView约束
    [self.adImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.top.equalTo(self.view.mas_top);
        make.trailing.equalTo(self.view.mas_trailing);
        make.height.equalTo(@150);
    }];
    
    // loginLabel约束
    [self.loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.adImageView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    // loginButton约束
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading).offset(30);
        make.top.equalTo(self.loginLabel.mas_bottom).offset(10);
        make.trailing.equalTo(self.view.mas_trailing).offset(-30);
    }];
    
    // registerButton约束
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(10);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    // otherLabel约束
    [self.otherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.wechatButton.mas_top).offset(-10);
    }];
    
    // wechatButton约束
    [self.wechatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading).offset(30);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.width.equalTo(self.qqButton.mas_width);
        make.height.equalTo(@30);
        make.trailing.equalTo(self.qqButton.mas_leading).offset(-30);
    }];
    
    // qqButton约束
    [self.qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view.mas_trailing).offset(-30);
        make.centerY.equalTo(self.wechatButton.mas_centerY);
        make.height.equalTo(self.wechatButton.mas_height);
    }];
}


@end
