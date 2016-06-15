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
#import "NSArray+Swizzle.h"
#import "NSDictionary+Swizzle.h"
#import "UIView+Swizzle.h"
#import "NSObject+Swizzle.h"
#import "NSSet+Swizzle.h"
#import "NSOrderedSet+Swizzle.h"
#import "NSUserDefaults+Swizzle.h"
#import "NSCache+Swizzle.h"
#import "NSString+Swizzle.h"

@implementation Swizzling

+ (void)load
{
#pragma 可以设置自动打开
//    [Swizzling swizzleMethods];
}

+ (void)swizzleMethods
{
#pragma Array
    NSError *error = nil;
    Class arrayClassM = NSClassFromString(@"__NSArrayM");
    [arrayClassM jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexSafe:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(objectAtIndexedSubscriptSafe:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(insertObjectSafe:atIndex:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(addObject:) withMethod:@selector(addObjectSafe:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(removeObjectAtIndexSafe:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(replaceObjectAtIndexSafe:withObject:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(removeObjectsInRange:) withMethod:@selector(removeObjectsInRangeSafe:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(arrayWithObject:) withMethod:@selector(arrayWithObjectSafe:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(arrayWithObjects:count:) withMethod:@selector(arrayWithObjectsSafe:count:) error:&error];
    [arrayClassM jr_swizzleMethod:@selector(subarrayWithRange:) withMethod:@selector(subarrayWithRangeSafe:) error:&error];
    
    Class arrayClassI = NSClassFromString(@"__NSArrayI");
    [arrayClassI jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexSafe:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(objectAtIndexedSubscriptSafe:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(arrayWithObject:) withMethod:@selector(arrayWithObjectSafe:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(arrayWithObjects:count:) withMethod:@selector(arrayWithObjectsSafe:count:) error:&error];
    [arrayClassI jr_swizzleMethod:@selector(subarrayWithRange:) withMethod:@selector(subarrayWithRangeSafe:) error:&error];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
    {
        Class arrayClass0 = NSClassFromString(@"__NSArray0");
        [arrayClass0 jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexSafe:) error:&error];
        [arrayClass0 jr_swizzleMethod:@selector(objectAtIndexedSubscript:) withMethod:@selector(objectAtIndexedSubscriptSafe:) error:&error];
        [arrayClass0 jr_swizzleMethod:@selector(arrayWithObject:) withMethod:@selector(arrayWithObjectSafe:) error:&error];
        [arrayClass0 jr_swizzleMethod:@selector(arrayWithObjects:count:) withMethod:@selector(arrayWithObjectsSafe:count:) error:&error];
        [arrayClass0 jr_swizzleMethod:@selector(subarrayWithRange:) withMethod:@selector(substringWithRangeSafe:) error:&error];
    }
    
#pragma Dictionary
    
    Class dicClass = NSClassFromString(@"NSDictionary");
    [dicClass jr_swizzleMethod:@selector(dictionaryWithObject:forKey:) withMethod:@selector(dictionaryWithObjectSafe:forKey:) error:&error];
    [dicClass jr_swizzleMethod:@selector(dictionaryWithObjects:forKeys:count:) withMethod:@selector(dictionaryWithObjectsSafe:forKeys:count:) error:&error];
    
    Class dicClassI = NSClassFromString(@"__NSDictionaryI");
    [dicClassI jr_swizzleMethod:@selector(objectForKey:) withMethod:@selector(objectForKeySafe:) error:&error];
    
    Class dicClassM = NSClassFromString(@"__NSDictionaryM");
    [dicClassM jr_swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(setObjectSafe:forKey:) error:&error];
    [dicClassM jr_swizzleMethod:@selector(objectForKey:) withMethod:@selector(objectForKeySafe:) error:&error];
    [dicClassM jr_swizzleClassMethod:@selector(removeObjectForKey:) withClassMethod:@selector(removeObjectForKeySafe:) error:&error];
    [dicClassM jr_swizzleMethod:@selector(setObject:forKeyedSubscript:) withMethod:@selector(setObjectSafe:forKeyedSubscript:) error:&error];
    
#pragma View
    Class viewClass = NSClassFromString(@"UIView");
    [viewClass jr_swizzleMethod:@selector(addSubview:) withMethod:@selector(addSubviewSafe:) error:&error];
    [viewClass jr_swizzleMethod:@selector(insertSubview:belowSubview:) withMethod:@selector(insertSubviewSafe:belowSubview:) error:&error];
    [viewClass jr_swizzleMethod:@selector(insertSubview:aboveSubview:) withMethod:@selector(insertSubviewSafe:aboveSubview:) error:&error];
    
#pragma Object
    Class objClass = NSClassFromString(@"NSObject");
    [objClass jr_swizzleMethod:@selector(addObserver:forKeyPath:options:context:) withMethod:@selector(addObserverSafe:forKeyPath:options:context:) error:&error];
    [objClass jr_swizzleMethod:@selector(removeObserver:forKeyPath:) withMethod:@selector(removeObserverSafe:forKeyPath:) error:&error];
    
#pragma String
    Class strClass = NSClassFromString(@"NSString");
    [strClass jr_swizzleMethod:@selector(stringWithUTF8String:) withMethod:@selector(stringWithUTF8StringSafe:) error:&error];
    [strClass jr_swizzleMethod:@selector(stringWithCString:encoding:) withMethod:@selector(stringWithCStringSafe:encoding:) error:&error];
    
    Class strpClass = NSClassFromString(@"NSPlaceholderString");
    [strpClass jr_swizzleMethod:@selector(initWithCString:encoding:) withMethod:@selector(initWithCStringSafe:encoding:) error:&error];
    
    Class strcfcClass = NSClassFromString(@"__NSCFConstantString");
    [strcfcClass jr_swizzleMethod:@selector(stringByAppendingString:) withMethod:@selector(stringByAppendingStringSafe:) error:&error];
    [strcfcClass jr_swizzleMethod:@selector(substringFromIndex:) withMethod:@selector(substringFromIndexSafe:) error:&error];
    [strcfcClass jr_swizzleMethod:@selector(substringToIndex:) withMethod:@selector(substringToIndexSafe:) error:&error];
    [strcfcClass jr_swizzleMethod:@selector(substringWithRange:) withMethod:@selector(substringWithRangeSafe:) error:&error];
    
    Class strpmClass = NSClassFromString(@"NSPlaceholderMutableString");
    [strpmClass jr_swizzleMethod:@selector(initWithCString:encoding:) withMethod:@selector(initWithCStringSafe:encoding:) error:&error];
    
    Class strcfClass = NSClassFromString(@"__NSCFString");
    [strcfClass jr_swizzleMethod:@selector(appendString:) withMethod:@selector(appendStringSafe:) error:&error];
    [strcfClass jr_swizzleMethod:@selector(insertString:atIndex:) withMethod:@selector(insertStringSafe:atIndex:) error:&error];
    [strcfClass jr_swizzleMethod:@selector(deleteCharactersInRange:) withMethod:@selector(deleteCharactersInRangeSafe:) error:&error];
    [strcfClass jr_swizzleMethod:@selector(stringByAppendingString:) withMethod:@selector(stringByAppendingStringSafe:) error:&error];
    [strcfClass jr_swizzleMethod:@selector(substringFromIndex:) withMethod:@selector(substringFromIndexSafe:) error:&error];
    [strcfClass jr_swizzleMethod:@selector(substringToIndex:) withMethod:@selector(substringToIndexSafe:) error:&error];
    [strcfClass jr_swizzleMethod:@selector(substringWithRange:) withMethod:@selector(substringWithRangeSafe:) error:&error];
    
#pragma Set
    Class setClass = NSClassFromString(@"NSSet");
    [setClass jr_swizzleMethod:@selector(setWithObject:) withMethod:@selector(setWithObjectSafe:) error:&error];
    
    Class setmClass = NSClassFromString(@"__NSSetM");
    [setmClass jr_swizzleMethod:@selector(addObject:) withMethod:@selector(addObjectSafe:) error:&error];
    [setmClass jr_swizzleMethod:@selector(removeObject:) withMethod:@selector(removeObjectSafe:) error:&error];
    
#pragma OrderSet
    Class ordsetClass = NSClassFromString(@"NSOrderedSet");
    [ordsetClass jr_swizzleMethod:@selector(orderedSetWithObject:) withMethod:@selector(orderedSetWithObjectSafe:) error:&error];
    
    Class pordsetClass = NSClassFromString(@"__NSPlaceholderOrderedSet");
    [pordsetClass jr_swizzleMethod:@selector(initWithObject:) withMethod:@selector(initWithObjectSafe:) error:&error];
    
    Class ordsetiClass = NSClassFromString(@"__NSOrderedSetI");
    [ordsetiClass jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexSafe:) error:&error];
    
    Class ordsetmClass = NSClassFromString(@"__NSOrderedSetM");
    [ordsetmClass jr_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(objectAtIndexSafe:) error:&error];
    [ordsetmClass jr_swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(removeObjectAtIndexSafe:) error:&error];
    [ordsetmClass jr_swizzleMethod:@selector(addObject:) withMethod:@selector(addObjectSafe:) error:&error];
    [ordsetmClass jr_swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(insertObjectSafe:atIndex:) error:&error];
    [ordsetmClass jr_swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(replaceObjectAtIndexSafe:withObject:) error:&error];
    
#pragma UserDefaults
    Class udClass = NSClassFromString(@"NSUserDefaults");
    [udClass jr_swizzleMethod:@selector(objectForKey:) withMethod:@selector(objectForKeySafe:) error:&error];
    [udClass jr_swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(setObjectSafe:forKey:) error:&error];
    [udClass jr_swizzleMethod:@selector(removeObjectForKey:) withMethod:@selector(removeObjectForKeySafe:) error:&error];
    [udClass jr_swizzleMethod:@selector(integerForKey:) withMethod:@selector(integerForKeySafe:) error:&error];
    [udClass jr_swizzleMethod:@selector(boolForKey:) withMethod:@selector(boolForKeySafe:) error:&error];
    
#pragma Cache
    Class cacheClass = NSClassFromString(@"NSCache");
    [cacheClass jr_swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(setObjectSafe:forKey:) error:&error];
    [cacheClass jr_swizzleMethod:@selector(setObject:forKey:cost:) withMethod:@selector(setObjectSafe:forKey:cost:) error:&error];
}

@end
