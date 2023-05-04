//
//  RNTestViewController.m
//  WWChat
//
//  Created by Gerry on 2022/11/16.
//  Copyright © 2022 盖闻科技. All rights reserved.
//

#import "RNTestViewController.h"


#define kRNTestViewModuleName  @"TestView"


@implementation RNTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSString *)moduleName {
    return @"RNMain";
}

- (NSDictionary *)moduleProperties {
    return @{
        kRN_PAGENAME : @"TestView",
        @"scores" : @[
          @{
            @"name" : @"Gerry",
            @"value": @"24"
           },
          @{
            @"name" : @"Tony",
            @"value": @"18"
          }
        ]
    };;
}
@end
