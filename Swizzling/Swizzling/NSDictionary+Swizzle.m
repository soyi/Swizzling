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
    if (anObject == nil) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        [self setObject:anObject forKeySafe:aKey];
    }
}

- (id)objectForKeySafe:(id)aKey
{
    if ( nil == aKey ) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
    return [self objectForKeySafe:aKey];
}

+ (id)dictionaryWithObjectsSafe:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
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
    if ( nil == obj || nil == key ) {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self setObjectSafe:obj forKeyedSubscript:key];
}

@end
