//
//  NSOrderedSet+Swizzle.m
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSOrderedSet+Swizzle.h"

@implementation NSOrderedSet (Swizzle)

+ (instancetype)orderedSetWithObjectSafe:(id)object
{
    if (object) {
        return [self orderedSetWithObjectSafe:object];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}
- (instancetype)initWithObjectSafe:(id)object
{
    if (object) {
        return [self initWithObjectSafe:object];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}
- (id)objectAtIndexSafe:(NSUInteger)idx
{
    if (idx < self.count) {
        return [self objectAtIndexSafe:idx];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

@end
