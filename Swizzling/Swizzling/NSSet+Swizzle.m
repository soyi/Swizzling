//
//  NSSet+Swizzle.m
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSSet+Swizzle.h"

@implementation NSSet (Swizzle)

+ (instancetype)setWithObjectSafe:(id)object
{
    if (object) {
        return [self setWithObjectSafe:object];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (void)addObjectSafe:(id)object {
    if (object) {
        [self addObjectSafe:object];
    } else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

- (void)removeObjectSafe:(id)object {
    if (object) {
        [self removeObjectSafe:object];
    } else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

@end
