//
//  AppDelegate.m
//  Swizzling
//
//  Created by Panda on 16/6/12.
//  Copyright © 2016年 Panda. All rights reserved.
//

#import "AppDelegate.h"
#import "Swizzling.h"
#import "NSString+Swizzle.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [Swizzling swizzleMethods];
    
    [self test];
    
    NSLog(@"OK");
    
    return YES;
}

- (void)test {
    NSMutableArray* array = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
    [array subarrayWithRange:NSMakeRange(1, 3)];
    [array removeObjectAtIndex:1];
    [array addObject:nil];
    [array removeObjectAtIndex:3];
    [array removeObjectsInRange:NSMakeRange(3, 2)];

    NSString* string = @"12345";
    [string substringFromIndex:6];
    [string substringToIndex:6];
    [string substringWithRange:NSMakeRange(0, 6)];

    NSMutableString* mstring = [NSMutableString string];
    [mstring appendString:@"12345"];
    NSLog(@"%@", [mstring substringToIndex:10]);
    NSLog(@"%@", [mstring substringWithRange:NSMakeRange(3, 10)]);

    NSCache * cache = [[NSCache alloc] init];

    [cache setObject:nil forKey:@""];
    [cache setObject:nil forKey:@"" cost:0];

    id a[] = {@"a",@"b", nil ,@"c"};
    NSLog(@"%@", [NSMutableArray arrayWithObjects:a count:4]);

    /* NSArray: Syntactic sugar */
    NSArray* item = nil;
    NSArray * items = @[@"a",@"b", item ,@"c"];
    NSLog(@"%@", items);

    /* NSDictory: Syntactic sugar */
    NSString* key = nil;
    NSString* value = nil;
    NSLog(@"%@", @{@"b":@"c",key:value, @"e":value});
    NSArray *arr = [NSArray array];
    [arr objectAtIndex:0];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
