//
//  NSUserDefaults+Swizzle.h
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Swizzle)

- (id)objectForKeySafe:(NSString *)defaultName;
- (NSInteger)integerForKeySafe:(NSString *)defaultName;
- (BOOL)boolForKeySafe:(NSString *)defaultName;
- (void)setObjectSafe:(id)value forKey:(NSString*)defaultName;
- (void)removeObjectForKeySafe:(NSString*)defaultName;

@end
