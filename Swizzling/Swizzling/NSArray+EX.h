//
//  NSArray+EX.h
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface NSArray (EX)
- (NSArray *)head:(NSUInteger)count;
- (NSArray *)tail:(NSUInteger)count;
- (id)safeObjectAtIndex:(NSUInteger)index;
@end

@interface NSMutableArray(EX)
- (id)objectAtIndexAlt:(NSUInteger)index;
- (id)objectAtIndexedSubscriptAlt:(NSUInteger)idx;
@end


@interface NSArray (Swizzle)
- (id)objectAtIndexAlt:(NSUInteger)index;
- (void)insertObjectAlt:(id)anObject atIndex:(NSUInteger)objectIndex;
- (void)addObjectAlt:(id)anObject;
- (void)removeLastObjectAlt;
- (void)removeObjectAtIndexAlt:(NSUInteger)index;
- (void)replaceObjectAtIndexAlt:(NSUInteger)index withObject:(id)anObject;
- (void)removeObjectAlt:(id)object;

@end
