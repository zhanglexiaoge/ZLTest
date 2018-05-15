//
//  ViewController.m
//  Sanbox
//
//  Created by Miugodigital on 2018/5/11.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property(nonatomic,weak)WLRRouter * router;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(80, 80, 150, 80);
    [btn setTitle:@"调转到登录页面" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(handelbtn) forControlEvents:UIControlEventTouchUpInside];
}


- (void)handelbtn {
    //    NSString *customURL = @"SanboxURL:";
    //    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
    
  
    
}
//[self.router handleURL:[NSURL URLWithString:@"WLRDemo://com.wlrroute.demo/user"] primitiveParameters:@{@"user":@"Neo~🙃🙃"} targetCallBack:^(NSError *error, id responseObject) {
//    NSLog(@"UserCallBack");
//} withCompletionBlock:^(BOOL handled, NSError *error) {
//    NSLog(@"UserHandleCompletion");
//}];

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
