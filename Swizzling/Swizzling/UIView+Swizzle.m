//
//  UIView+Swizzle.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright (c) 2013年 Baidu.com. All rights reserved.
//

#import "UIView+Swizzle.h"

@implementation UIView(Swizzle)

- (void)addSubviewSafe:(UIView *)view
{
    if (view == self) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self addSubviewSafe:view];
}

- (void)insertSubviewSafe:(UIView *)view atIndex:(NSInteger)index
{
    if (view == self)  {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self insertSubviewSafe:view atIndex:index];
}

- (void)insertSubviewSafe:(UIView *)view belowSubview:(UIView *)siblingSubview
{
    if (view == self) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self insertSubviewSafe:view belowSubview:siblingSubview];
}

- (void)insertSubviewSafe:(UIView *)view aboveSubview:(UIView *)siblingSubview
{
    if (view == self) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self insertSubviewSafe:view aboveSubview:siblingSubview];
}

@end
