//
//  AppDelegate.m
//  ZLPodDemo
//
//  Created by Miugodigital on 2018/5/15.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ZLNavViewController.h"
#import "ZLTabBarViewController.h"
#import "JLRoutes.h"
#import "AppDelegate+RegisterRoute.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ZLTabBarViewController *tabbarController = [[ ZLTabBarViewController  alloc]init];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    [self registerRoute];
    return YES;
}
- (void)registerRoute{
   //注册路由 app内页面跳转
    [self registerRouteWithScheme:@"ZLpodJLRouteURLHome"];
    
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    NSLog(@"%@",url);
    
    return [[JLRoutes routesForScheme:@"ZLpodJLRouteURLHome"]routeURL:url];
    
   
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
