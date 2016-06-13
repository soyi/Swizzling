//
//  UIView+Swizzle.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright (c) 2013年 Baidu.com. All rights reserved.
//

#import "UIView+Swizzle.h"

@implementation UIView(Swizzle)

- (void)addSubviewAlt:(UIView *)view
{
    if ( view == self ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self addSubviewAlt:view];
}

- (void)insertSubviewAlt:(UIView *)view atIndex:(NSInteger)index
{
    if ( view == self )  {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self insertSubviewAlt:view atIndex:index];
}

- (void)insertSubviewAlt:(UIView *)view belowSubview:(UIView *)siblingSubview
{
    if ( view == self ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self insertSubviewAlt:view belowSubview:siblingSubview];
}

- (void)insertSubviewAlt:(UIView *)view aboveSubview:(UIView *)siblingSubview
{
    if ( view == self ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return ;
    }
    [self insertSubviewAlt:view aboveSubview:siblingSubview];
}

@end
