//
//  NSString+Swizzle.h
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Swizzle)

+ (NSString*)stringWithUTF8StringSafe:(const char *)nullTerminatedCString;
+ (nullable instancetype)stringWithCStringSafe:(const char *)cString encoding:(NSStringEncoding)enc;
- (nullable instancetype)initWithCStringSafe:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
- (NSString *)stringByAppendingStringSafe:(NSString *)aString;
- (NSString *)substringFromIndexSafe:(NSUInteger)from;
- (NSString *)substringToIndexSafe:(NSUInteger)to;
- (NSString *)substringWithRangeSafe:(NSRange)range;
- (void)appendStringSafe:(NSString *)aString;
- (void)insertStringSafe:(NSString *)aString atIndex:(NSUInteger)loc;
- (void)deleteCharactersInRangeSafe:(NSRange)range;

@end

NS_ASSUME_NONNULL_END