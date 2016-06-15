//
//  NSString+Swizzle.m
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "NSString+Swizzle.h"

@implementation NSString (Swizzle)

+ (NSString*)stringWithUTF8StringSafe:(const char *)nullTerminatedCString
{
    if (NULL != nullTerminatedCString) {
        return [self stringWithUTF8StringSafe:nullTerminatedCString];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

+ (nullable instancetype)stringWithCStringSafe:(const char *)cString encoding:(NSStringEncoding)enc
{
    if (NULL != cString){
        return [self stringWithCStringSafe:cString encoding:enc];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (nullable instancetype)initWithCStringSafe:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
    if (NULL != nullTerminatedCString){
        return [self initWithCStringSafe:nullTerminatedCString encoding:encoding];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (NSString *)stringByAppendingStringSafe:(NSString *)aString
{
    if (aString){
        return [self stringByAppendingStringSafe:aString];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return self;
    }
}

- (NSString *)substringFromIndexSafe:(NSUInteger)from
{
    if (from <= self.length) {
        return [self substringFromIndexSafe:from];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (NSString *)substringToIndexSafe:(NSUInteger)to
{
    if (to <= self.length) {
        return [self substringToIndexSafe:to];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return self;
    }
}

- (NSString *)substringWithRangeSafe:(NSRange)range
{
    if (range.location + range.length <= self.length) {
        return [self substringWithRangeSafe:range];
    }else if (range.location < self.length){
        return [self substringWithRangeSafe:NSMakeRange(range.location, self.length-range.location)];
    }else {
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
        return nil;
    }
}

- (void)appendStringSafe:(NSString *)aString
{
    if (aString){
        [self appendStringSafe:aString];
    }else{
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}
- (void)insertStringSafe:(NSString *)aString atIndex:(NSUInteger)loc
{
    if (aString && loc <= self.length) {
        [self insertStringSafe:aString atIndex:loc];
    }else{
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}
- (void)deleteCharactersInRangeSafe:(NSRange)range
{
    if (range.location + range.length <= self.length){
        [self deleteCharactersInRangeSafe:range];
    }else{
        NSLog(@"Error_Stack : %@", [NSThread callStackSymbols]);
    }
}

@end
