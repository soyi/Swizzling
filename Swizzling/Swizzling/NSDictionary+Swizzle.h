//
//  NSDictionary+Swizzle.h
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Swizzle)
- (void)setObject:(id)anObject forKeyAlt:(id <NSCopying>)aKey;
- (id)objectForKeyAlt:(id)aKey;
+ (id)dictionaryWithObjectsAlt:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt;
- (void)setObjectAlt:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end
