//
//  RNBridge.m
//  xxshop
//
//  Created by Gerry on 2022/11/17.
//  Copyright © 2022 XX科技. All rights reserved.
//

#import "RNBridge.h"
#import "RCTDevLoadingView.h"

@interface RNBridge() <RCTBridgeDelegate>

@end

@implementation RNBridge
+ (instancetype)sharedBridge {
    static RNBridge *_shareBridge = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareBridge = [[self alloc] init];
    });
    return _shareBridge;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupBridge];
    }
    return self;
}

- (void)setupBridge {
    if (!_bridge) {
        _bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
        
#if RCT_DEV
        [_bridge moduleForClass:[RCTDevLoadingView class]];
#endif
    }
}

#pragma mark - RCTBridgeDelegate
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
    NSURL *sourceUrl = [self remoteSourceUrl];
    
#if LOAD_LOCAL_BUNDLE
    sourceUrl = [self localSourceUrl];
#endif
    return sourceUrl;
}


#pragma mark - bundle加载

- (NSURL *)remoteSourceUrl {
//    NSString *prefixPath = @"http://192.168.42.42:8081";
    NSString *prefixPath = @"http://localhost:8081";
    NSString *path = [NSString stringWithFormat:@"%@/index.bundle?platform=ios", prefixPath];
    NSURL *sourceUrl = [NSURL URLWithString:path];
    return sourceUrl;
}

/**
 * @brief 加载本地bundle
 *
 */
- (NSURL *)localSourceUrl {
    NSURL *sourceUrl = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    return sourceUrl;
}

@end
