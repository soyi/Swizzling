//
//  NSObject+Swizzle.h
//  Swizzling
//
//  Created by Panda on 16/6/15.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

- (void)addObserverSafe:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
- (void)removeObserverSafe:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end
