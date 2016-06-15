//
//  NSCache+Swizzle.m
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSCache+Swizzle.h"

@implementation NSCache (Swizzle)

- (void)setObjectSafe:(id)obj forKey:(id)key
{
    if (obj && key) {
        [self setObjectSafe:obj forKey:key];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}
- (void)setObjectSafe:(id)obj forKey:(id)key cost:(NSUInteger)g
{
    if (obj && key) {
        [self setObjectSafe:obj forKey:key cost:g];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

@end
