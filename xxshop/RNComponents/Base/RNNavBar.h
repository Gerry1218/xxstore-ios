//
//  RNNavBar.h
//  xxshop
//
//  Created by Gerry on 2023/4/14.
//  Copyright © 2023 XX科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RNNavBarDelegate <NSObject>
- (void)backButtonPressed:(id)sender;
@end

@interface RNNavBar : UIView
@property(nonatomic, strong) UIButton *backButton;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, weak) id<RNNavBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
