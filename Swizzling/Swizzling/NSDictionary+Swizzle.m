//
//  NSDictionary+Swizzle.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSDictionary+Swizzle.h"

@implementation NSDictionary (Swizzle)
- (void)setObject:(id)anObject forKeyAlt:(id <NSCopying>)aKey
{
    if (anObject == nil) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }else{
        [self setObject:anObject forKeyAlt:aKey];
    }
}


- (id)objectForKeyAlt:(id)aKey
{
    if ( nil == aKey ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
    return [self objectForKeyAlt:aKey];
}


+ (id)dictionaryWithObjectsAlt:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    for (int i = 0; i < cnt; ++i){
        id object = objects[i];
        if (object == nil) {
            NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
            return nil;
        }
    }
    id retObject = [self dictionaryWithObjectsAlt:objects forKeys:keys count:cnt];
    return retObject;
}

- (void)setObjectAlt:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    if ( nil == obj || nil == key ) {
        NSLog(@"Error: stack : %@", [NSThread callStackSymbols]);
        return;
    }
    [self setObjectAlt:obj forKeyedSubscript:key];
}

@end
