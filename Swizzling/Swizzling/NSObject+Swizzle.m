//
//  NSObject+Swizzle.m
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSObject+Swizzle.h"

@implementation NSObject (Swizzle)

- (void)addObserverSafe:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if (!observer || !keyPath.length) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    @try {
        [self addObserverSafe:observer forKeyPath:keyPath options:options context:context];
    }
    @catch (NSException *exception) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}
- (void)removeObserverSafe:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if (!observer || !keyPath.length) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    @try {
        [self removeObserverSafe:observer forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

@end
