//
//  AppDelegate+RegisterRoute.m
//  ZLPodDemo
//
//  Created by Miugodigital on 2018/5/16.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "AppDelegate+RegisterRoute.h"
#import "JLRoutes.h"
#import <objc/runtime.h> //runtime
@implementation AppDelegate (RegisterRoute)
- (void)registerRouteWithScheme:(NSString *)scheme{
    //RouteOne://push/FirstNextViewController
    [[JLRoutes routesForScheme:scheme] addRoute:@"/push/:controller"handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@",parameters);
        Class class = NSClassFromString(parameters[@"controller"]);
        
        UIViewController *nextVC = [[class alloc] init];
        
        [self paramToVc:nextVC param:parameters];
        UIViewController *currentVc = [self currentViewController];
        [currentVc.navigationController pushViewController:nextVC animated:YES];
        return YES;
    }];
}

//传参数
-(void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    //        runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}

//确定是哪个viewcontroller
-(UIViewController *)currentViewController{
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = self.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}
@end
