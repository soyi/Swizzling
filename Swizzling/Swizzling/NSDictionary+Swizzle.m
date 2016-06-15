//
//  NSDictionary+Swizzle.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSDictionary+Swizzle.h"

@implementation NSDictionary (Swizzle)
- (void)setObject:(id)anObject forKeySafe:(id <NSCopying>)aKey
{
    if (!anObject) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self setObject:anObject forKeySafe:aKey];
}

- (instancetype)objectForKeySafe:(id)aKey
{
    if (!aKey) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
    return [self objectForKeySafe:aKey];
}

+ (instancetype)dictionaryWithObjectSafe:(id)object forKey:(id)key
{
    if (object && key) {
        return [self dictionaryWithObjectSafe:object forKey:key];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

+ (instancetype)dictionaryWithObjectsSafe:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    for (int i = 0; i < cnt; ++i){
        id object = objects[i];
        if (object == nil) {
            NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
            return nil;
        }
    }
    id retObject = [self dictionaryWithObjectsSafe:objects forKeys:keys count:cnt];
    return retObject;
}

- (void)setObjectSafe:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    if (nil == obj || nil == key) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self setObjectSafe:obj forKeyedSubscript:key];
}

- (void)removeObjectForKeySafe:(id)aKey {
    if (aKey) {
        [self removeObjectForKeySafe:aKey];
    } else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

@end
