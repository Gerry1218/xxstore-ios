//
//  RNBridge.h
//  xxshop
//
//  Created by Gerry on 2022/11/17.
//  Copyright © 2022 XX科技. All rights reserved.
//

#import <React/RCTBridge.h>
#import <React/RCTDevSettings.h>

NS_ASSUME_NONNULL_BEGIN

#define LOAD_LOCAL_BUNDLE       0

@interface RNBridge : NSObject
@property(nonatomic, strong, readonly) RCTBridge *bridge;

+ (instancetype)sharedBridge;

@end

NS_ASSUME_NONNULL_END
