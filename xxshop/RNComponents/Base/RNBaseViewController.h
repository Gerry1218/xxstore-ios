//
//  RNBaseViewController.h
//  xxshop
//
//  Created by Gerry on 2022/11/16.
//  Copyright © 2022 XX科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTRootView.h>
#import "RNBridge.h"
#import "RNNavBar.h"

NS_ASSUME_NONNULL_BEGIN


@interface RNBaseViewController : UIViewController
@property(nonatomic, strong) RNNavBar *navBar;
@property(nonatomic, strong) NSDictionary *paramDict;

- (void)setNavTitle:(NSString *)title;
- (NSString *)moduleName;
- (NSDictionary *)moduleProperties;
@end

NS_ASSUME_NONNULL_END
