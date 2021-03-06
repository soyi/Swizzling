//
//  NSDictionary+Swizzle.h
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Swizzle)
- (void)setObjectSafe:(id)anObject forKey:(id <NSCopying>)aKey;
- (id)objectForKeySafe:(id)aKey;
+ (id)dictionaryWithObjectsSafe:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt;
- (void)setObjectSafe:(id)obj forKeyedSubscript:(id <NSCopying>)key;
+ (instancetype)dictionaryWithObjectSafe:(id)object forKey:(id)key;
- (void)removeObjectForKeySafe:(id)aKey;

@end
