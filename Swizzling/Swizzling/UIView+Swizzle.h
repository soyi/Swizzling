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

- (void)addSubviewAlt:(UIView *)view;

- (void)insertSubviewAlt:(UIView *)view atIndex:(NSInteger)index;

- (void)insertSubviewAlt:(UIView *)view belowSubview:(UIView *)siblingSubview;

- (void)insertSubviewAlt:(UIView *)view aboveSubview:(UIView *)siblingSubview;

@end
