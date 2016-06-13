//
//  NSArray+EX.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSArray+EX.h"

@implementation NSArray (EX)

- (NSArray *)head:(NSUInteger)count
{
	if ( [self count] < count )
	{
		return self;
	}
	else
	{
		NSMutableArray * tempFeeds = [NSMutableArray array];
		for ( NSObject * elem in self )
		{
			[tempFeeds addObject:elem];
			if ( [tempFeeds count] >= count )
				break;
		}
		return tempFeeds;
	}
}

- (NSArray *)tail:(NSUInteger)count
{
	NSRange range = NSMakeRange( self.count - count, count );
	return [self subarrayWithRange:range];
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if ( index >= self.count ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
	return [self objectAtIndex:index];
}


@end

@implementation NSMutableArray (EX)

- (id)objectAtIndexAlt:(NSUInteger)index
{
    if ( index < [self count] ) {
        return [self objectAtIndexAlt:index];
    }else {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}


- (id)objectAtIndexedSubscriptAlt:(NSUInteger)idx
{
    if ( idx >= [self count] ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
    return [self objectAtIndexedSubscriptAlt:idx];
}

@end


@implementation NSArray (Swizzle)

- (id)objectAtIndexAlt:(NSUInteger)index
{
    if ( index < [self count] ) {
        return [self objectAtIndexAlt:index];
    }else {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}


- (id)objectAtIndexedSubscriptAlt:(NSUInteger)idx
{
    if ( idx >= [self count] ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
    return [self objectAtIndexedSubscriptAlt:idx];
}


- (void)insertObjectAlt:(id)anObject atIndex:(NSUInteger)objectIndex
{
    if (anObject == nil) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        //暂不保护
//        if (objectIndex > [self count]) return;
        [self insertObjectAlt:anObject atIndex:objectIndex];
    }
}

- (void)addObjectAlt:(id)anObject
{
    if ( anObject == nil ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        [self addObjectAlt:anObject];
    }
}

- (void)removeLastObjectAlt
{
    [self removeLastObjectAlt];
}

- (void)removeObjectAtIndexAlt:(NSUInteger)index
{
    if ( index >= [self count] || [self count] <= 0 ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self removeObjectAtIndexAlt:index];
}

-(void)removeObjectAlt:(id)object
{
    if ( [self count] <= 0 ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }
    return [self removeObjectAlt:object];
}

- (void)replaceObjectAtIndexAlt:(NSUInteger)index withObject:(id)anObject
{
    if ( index >= [self count]  || nil == anObject ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self replaceObjectAtIndexAlt:index withObject:anObject];
}



@end
