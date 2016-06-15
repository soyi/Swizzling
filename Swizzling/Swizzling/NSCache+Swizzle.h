//
//  NSCache+Swizzle.h
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCache (Swizzle)

- (void)setObjectSafe:(id)obj forKey:(id)key;
- (void)setObjectSafe:(id)obj forKey:(id)key cost:(NSUInteger)g;

@end
