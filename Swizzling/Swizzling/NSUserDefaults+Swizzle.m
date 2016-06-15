//
//  NSUserDefaults+Swizzle.m
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSUserDefaults+Swizzle.h"

@implementation NSUserDefaults (Swizzle)

- (id)objectForKeySafe:(NSString *)defaultName
{
    if (defaultName) {
        return [self objectForKeySafe:defaultName];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (NSInteger)integerForKeySafe:(NSString *)defaultName
{
    if (defaultName) {
        return [self integerForKeySafe:defaultName];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return 0;
    }
}

- (BOOL)boolForKeySafe:(NSString *)defaultName
{
    if (defaultName) {
        return [self boolForKeySafe:defaultName];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return NO;
    }
}

- (void)setObjectSafe:(id)value forKey:(NSString*)defaultName
{
    if (defaultName) {
        [self setObjectSafe:value forKey:defaultName];
    } else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}
- (void)removeObjectForKeySafe:(NSString*)defaultName
{
    if (defaultName) {
        [self removeObjectForKeySafe:defaultName];
    } else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

@end
