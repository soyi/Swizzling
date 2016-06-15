//
//  NSOrderedSet+Swizzle.h
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOrderedSet (Swizzle)

+ (instancetype)orderedSetWithObjectSafe:(id)object;
- (instancetype)initWithObjectSafe:(id)object;
- (id)objectAtIndexSafe:(NSUInteger)idx;

@end
