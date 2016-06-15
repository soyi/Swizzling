//
//  NSArray+EX.h
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Swizzle)
- (id)objectAtIndexSafe:(NSUInteger)index;
- (id)objectAtIndexedSubscriptSafe:(NSUInteger)idx;
- (void)insertObjectSafe:(id)anObject atIndex:(NSUInteger)objectIndex;
- (void)addObjectSafe:(id)anObject;
- (void)removeObjectAtIndexSafe:(NSUInteger)index;
- (void)replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject;
- (void)removeObjectsInRangeSafe:(NSRange)range;
- (NSArray *)subarrayWithRangeSafe:(NSRange)range;
+ (instancetype)arrayWithObjectSafe:(id)anObject;
+ (instancetype)arrayWithObjectsSafe:(const id [])objects count:(NSUInteger)cnt;

@end
