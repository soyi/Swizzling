//
//  NSSet+Swizzle.h
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (Swizzle)

+ (instancetype)setWithObjectSafe:(id)object;
- (void)addObjectSafe:(id)object;
- (void)removeObjectSafe:(id)object;

@end
