//
//  RNBaseViewController.m
//  xxshop
//
//  Created by Gerry on 2022/11/16.
//  Copyright © 2022 XX科技. All rights reserved.
//

#import "RNBaseViewController.h"

@interface RNBaseViewController () <RNNavBarDelegate>
@property(nonatomic, strong) RCTRootView *rootView;
@end

@implementation RNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self layoutUI];
}

- (void)setupUI {
    [self.view addSubview:self.rootView];
    [self.view addSubview:self.navBar];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)layoutUI {
    CGFloat h = kStatusBarHeight + kNavBarHeight;
    [self.navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(@0);
        make.height.mas_equalTo(h);
    }];
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navBar.mas_bottom);
        make.leading.trailing.bottom.equalTo(self.view);
        make.height.mas_equalTo(ScreenHeight - h);
    }];
}

- (RCTRootView *)rootView {
    if (!_rootView) {
        _rootView = [[RCTRootView alloc] initWithBridge:[RNBridge sharedBridge].bridge
                                             moduleName:[self moduleName]
                                      initialProperties:[self moduleProperties]];
    }
    return _rootView;
}


- (NSString *)moduleName {
    return @"RNMain";
}

- (RNNavBar *)navBar {
    if (!_navBar) {
        _navBar = [[RNNavBar alloc] init];
        _navBar.delegate = self;
    }
    return _navBar;
}

/**
 *@brief 合并rn透传参数
 */
- (NSDictionary *)moduleProperties {
    NSMutableDictionary *params = [self defaultProps].mutableCopy;
    if (self.paramDict) {
        NSDictionary *val = params[kRN_PARAMS];
        if (!val) {
            [params setObject:self.paramDict forKey:kRN_PARAMS];
        }
        else {
            if (![val isKindOfClass:NSDictionary.class]) {
                NSAssert(0, @"params 应为字典对象...");
            }
            NSMutableDictionary *mVal = val.mutableCopy;
            [mVal addEntriesFromDictionary:self.paramDict];
            [params setObject:mVal forKey:kRN_PARAMS];
        }
    }
    return params;
}

/**
 * @brief 原生参数
 */
- (NSDictionary *)defaultProps {
    return @{};
}


#pragma mark
- (void)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Public
- (void)setNavTitle:(NSString *)title {
    self.navBar.titleLabel.text = title;
}
@end
