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
    if (index < [self count]) {
        return [self objectAtIndexSafe:index];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (id)objectAtIndexedSubscriptSafe:(NSUInteger)idx
{
    if (idx >= [self count]) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }else {
        return [self objectAtIndexedSubscriptSafe:idx];
    }
}

- (void)insertObjectSafe:(id)anObject atIndex:(NSUInteger)objectIndex
{
    if (!anObject) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    if (objectIndex > [self count]) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self insertObjectSafe:anObject atIndex:objectIndex];
}

- (void)addObjectSafe:(id)anObject
{
    if (!anObject) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        [self addObjectSafe:anObject];
    }
}

- (void)removeObjectAtIndexSafe:(NSUInteger)index
{
    if (index >= [self count] || [self count] <= 0) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self removeObjectAtIndexSafe:index];
}

- (void)replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject
{
    if (index >= [self count]  || nil == anObject) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self replaceObjectAtIndexSafe:index withObject:anObject];
}

- (void)removeObjectsInRangeSafe:(NSRange)range {
    if (range.location + range.length <= self.count) {
        [self removeObjectsInRangeSafe:range];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

- (NSArray *)subarrayWithRangeSafe:(NSRange)range
{
    if (range.location + range.length <= self.count){
        return [self subarrayWithRangeSafe:range];
    }else if (range.location < self.count){
        return [self subarrayWithRangeSafe:NSMakeRange(range.location, self.count-range.location)];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

+ (instancetype)arrayWithObjectSafe:(id)anObject
{
    if (anObject) {
        return [self arrayWithObjectSafe:anObject];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

+ (instancetype)arrayWithObjectsSafe:(const id [])objects count:(NSUInteger)cnt
{
    NSInteger index = 0;
    id objs[cnt];
    for (NSInteger i = 0; i < cnt ; ++i) {
        if (objects[i]) {
            objs[index++] = objects[i];
        }
    }
    return [self arrayWithObjectsSafe:objs count:index];
}

@end
