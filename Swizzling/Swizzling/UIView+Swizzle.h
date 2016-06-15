//
//  UIView+Swizzle.h
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView(Swizzle)

- (void)addSubviewSafe:(UIView *)view;
- (void)insertSubviewSafe:(UIView *)view atIndex:(NSInteger)index;
- (void)insertSubviewSafe:(UIView *)view belowSubview:(UIView *)siblingSubview;
- (void)insertSubviewSafe:(UIView *)view aboveSubview:(UIView *)siblingSubview;

@end
