
//  ZLTabBarViewController.m
//  ZLPodDemo
//
//  Created by Miugodigital on 2018/5/16.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "ZLTabBarViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "FindViewController.h"
#import "ZLNavViewController.h"
#import "JLRoutes.h" //路由管理第三方
@interface ZLTabBarViewController ()

@end

@implementation ZLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self SetVC];
}
- (void)SetVC{
    HomeViewController *one = [[HomeViewController alloc]init];
    ZLNavViewController *nav1 = [[ ZLNavViewController alloc]initWithRootViewController:one];
    nav1.tabBarItem.title = @"首页";
   

    
    FindViewController *two = [[FindViewController alloc]init];
     ZLNavViewController *nav2 = [[ ZLNavViewController alloc]initWithRootViewController:two];
    nav2.tabBarItem.title = @"模块二";
    
    
    MineViewController *three = [[MineViewController alloc]init];
     ZLNavViewController *nav3 = [[ ZLNavViewController alloc]initWithRootViewController:three];
    nav3.tabBarItem.title = @"我的";
 
    
    [self addRoute];
    self.viewControllers = @[nav1,nav2,nav3];
    
    //ZLpodDemoURL
   
}
//注册：外部跳转，呈现tab里的内容
- (void)addRoute{
    __weak typeof(self) weakSelf = self;
    [[JLRoutes routesForScheme:@"ZLpodJLRouteURLHome"]addRoute:@"/:tab1" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"=====%@",parameters);
        ZLNavViewController *nav = nil;
        NSString *className = parameters[@"tab1"];
        if ([className isEqualToString:NSStringFromClass([HomeViewController class])]) {
//            nav = [self creatNavWithClassString:parameters[@"tab1"] params:[NSDictionary dictionaryWithObjectsAndKeys:TABBAR_HomeItem_Title,@"title",TABBAR_HomeItem_NormalImg,@"norImageName",TABBAR_HomeItem_SelectImg,@"selectImageName", nil]];
            nav =[self creatNavWithClassString:parameters[@"tab1"] params:nil];
            
            self.selectedIndex = 0;
        }else if([className isEqualToString:NSStringFromClass([FindViewController class])]){
//            nav = [self creatNavWithClassString:parameters[@"tab1"] params:[NSDictionary dictionaryWithObjectsAndKeys:TABBAR_HistoryItem_Title,@"title",TABBAR_HistoryItem_NormalImg,@"norImageName",TABBAR_HistoryItem_SelectImg,@"selectImageName", nil]];
            
            nav =[self creatNavWithClassString:parameters[@"tab1"] params:nil];
            self.selectedIndex = 1;
        }else{
//            nav = [self creatNavWithClassString:parameters[@"tab1"]params:[NSDictionary dictionaryWithObjectsAndKeys:TABBAR_NewsItem_Title,@"title",TABBAR_NewsItem_NormalImg,@"norImageName",TABBAR_NewsItem_SelectImg,@"selectImageName", nil]];
              nav =[self creatNavWithClassString:parameters[@"tab1"] params:nil];
            self.selectedIndex = 2;
        }
        NSMutableArray *navs = [NSMutableArray arrayWithArray:weakSelf.viewControllers];
        [navs replaceObjectAtIndex:self.selectedIndex withObject:nav];
        self.viewControllers = navs;
        return YES;
    }];
}

- (ZLNavViewController*)creatNavWithClassString:(NSString*)className params:(NSDictionary *)params{
    Class class1 =  NSClassFromString(className);
    UIViewController *vc1 = [[class1 alloc] init];
    ZLNavViewController *nav = [[ ZLNavViewController alloc]initWithRootViewController:vc1];
//    LZJNavgationViewController *nav = [self viewControllerWithTitle:params[@"title"] image:[UIImage imageNamed:params[@"norImageName"]] selectImage:[UIImage imageNamed:params[@"selectImageName"]] VC:vc1];
    return nav;
    
}

//-(LZJNavgationViewController *) viewControllerWithTitle:(NSString *) title image:(UIImage *)image selectImage:(UIImage *)selectImage VC:(UIViewController *)VC{
//    VC.tabBarItem.image = image;
//    VC.tabBarItem.selectedImage = selectImage;
//    VC.title = title ;
//    VC.tabBarItem.title = title;
//    LZJNavgationViewController *nav = [[LZJNavgationViewController alloc] initWithRootViewController:VC];
//    return nav;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
