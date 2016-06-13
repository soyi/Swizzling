//
//  Swizzling.m
//  Swizzling
//
//  Created by HuShuoyi on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "Swizzling.h"
#import <objc/runtime.h>
#import "JRSwizzle.h"
#import "NSArray+EX.h"
#import "NSDictionary+Swizzle.h"
#import "UIView+Swizzle.h"

@implementation Swizzling

+ (void)load
{
    //这里默认打开
    [Swizzling swizzleMethods];
}

+ (void)swizzleMethods
{
    NSError *error = nil;
    Class arrayClassM = NSClassFromString(@"__NSArrayM");
    [arrayClassM jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexAlt:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(objectAtIndexedSubscriptAlt:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(insertObjectAlt:atIndex:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(addObject:) withMethod:@selector(addObjectAlt:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(removeLastObject) withMethod:@selector(removeLastObjectAlt) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(removeObjectAtIndexAlt:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(removeObject:) withMethod:@selector(removeObjectAlt:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(replaceObjectAtIndexAlt:withObject:) error:&error];
    
    
    Class arrayClassI = NSClassFromString(@"__NSArrayI");
    [arrayClassI jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexAlt:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(objectAtIndexedSubscriptAlt:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(insertObjectAlt:atIndex:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(addObject:) withMethod:@selector(addObjectAlt:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(removeLastObject) withMethod:@selector(removeLastObjectAlt) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(removeObjectAtIndexAlt:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(removeObject:) withMethod:@selector(removeObjectAlt:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(replaceObjectAtIndexAlt:withObject:) error:&error];
    
    
    Class dicClass = NSClassFromString(@"__NSDictionaryM");
    
    [dicClass jr_swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(setObject:forKeyAlt:) error:&error];
    
    [dicClass jr_swizzleMethod:@selector(objectForKey:) withMethod:@selector(objectForKeyAlt:) error:&error];
    
    [NSDictionary jr_swizzleClassMethod:@selector(dictionaryWithObjects:forKeys:count:) withClassMethod:@selector(dictionaryWithObjectsAlt:forKeys:count:) error:&error];
    
    [dicClass jr_swizzleMethod:@selector(setObject:forKeyedSubscript:) withMethod:@selector(setObjectAlt:forKeyedSubscript:) error:&error];
    ;
    
    Class viewClass = NSClassFromString(@"UIView");
    [viewClass jr_swizzleMethod:@selector(addSubview:) withMethod:@selector(addSubviewAlt:) error:&error];
    [viewClass jr_swizzleMethod:@selector(insertSubview:belowSubview:) withMethod:@selector(insertSubviewAlt:belowSubview:) error:&error];
    [viewClass jr_swizzleMethod:@selector(insertSubview:aboveSubview:) withMethod:@selector(insertSubviewAlt:aboveSubview:) error:&error];
    
    
}

@end
