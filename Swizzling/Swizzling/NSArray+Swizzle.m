//
//  NSArray+EX.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSArray+Swizzle.h"


@implementation NSArray (Swizzle)

- (id)objectAtIndexSafe:(NSUInteger)index
{
    if ( index < [self count] ) {
        return [self objectAtIndexSafe:index];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (id)objectAtIndexedSubscriptSafe:(NSUInteger)idx
{
    if ( idx >= [self count] ) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
    return [self objectAtIndexedSubscriptSafe:idx];
}

- (void)insertObjectSafe:(id)anObject atIndex:(NSUInteger)objectIndex
{
    if (anObject == nil) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        //暂不保护
//        if (objectIndex > [self count]) return;
        [self insertObjectSafe:anObject atIndex:objectIndex];
    }
}

- (void)addObjectSafe:(id)anObject
{
    if ( anObject == nil ) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        [self addObjectSafe:anObject];
    }
}

- (void)removeObjectAtIndexSafe:(NSUInteger)index
{
    if ( index >= [self count] || [self count] <= 0 ) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self removeObjectAtIndexSafe:index];
}

- (void)replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject
{
    if ( index >= [self count]  || nil == anObject ) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self replaceObjectAtIndexSafe:index withObject:anObject];
}

@end
