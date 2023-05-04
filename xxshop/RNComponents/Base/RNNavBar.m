//
//  RNNavBar.m
//  xxshop
//
//  Created by Gerry on 2023/4/14.
//  Copyright © 2023 XX科技. All rights reserved.
//

#import "RNNavBar.h"

@interface RNNavBar ()
@property(nonatomic, strong) UIView *titleView;
@end

@implementation RNNavBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupUI];
        [self layoutUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self layoutUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
        [self layoutUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.titleView];
    [self.titleView addSubview:self.backButton];
    [self.titleView addSubview:self.titleLabel];
}

- (void)layoutUI {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.height.mas_equalTo(kNavBarHeight);
        make.bottom.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@10);
        make.centerY.equalTo(@0);
    }];
}

#pragma mark  Views
- (UIView *)titleView {
    if(!_titleView) {
        _titleView = [[UIView alloc] init];
        
        CALayer *layer = [CALayer new];
        layer.backgroundColor = kColor_C8C8C8.CGColor;
        layer.frame = CGRectMake(0, kNavBarHeight-0.5, ScreenWidth, 0.5);
        [_titleView.layer addSublayer:layer];
    }
    return _titleView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *backImage = [kImageNamed(@"nav_back_black") imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_backButton setImage:backImage forState:UIControlStateNormal];
        _backButton.tintColor = kColor_333333;
        [_backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kBoldFontWithSize(16);
    }
    return _titleLabel;
}

- (void)backButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(backButtonPressed:)]) {
        [self.delegate backButtonPressed:sender];
    }
    
}
@end
