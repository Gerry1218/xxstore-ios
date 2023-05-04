//
//  UIColor+Utils.h
//  xxshop
//
//  Created by Gerry on 2018/11/28.
//  Copyright © 2018年 XX科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
