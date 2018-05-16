//
//  HomeViewController.m
//  ZLPodDemo
//
//  Created by Miugodigital on 2018/5/16.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16 weight:1];
    btn.frame = CGRectMake(100, 200, 100, 100);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)jump
{
    //ZLpodDemoURLHome 首页模块 传值
    NSString *url = @"ZLpodJLRouteURLHome://push/HomeFirstViewController?titleText=fromFirst";
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];

}

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
