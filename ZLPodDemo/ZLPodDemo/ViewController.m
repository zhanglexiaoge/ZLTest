//
//  ViewController.m
//  ZLPodDemo
//
//  Created by Miugodigital on 2018/5/15.
//  Copyright © 2018年 zhangle. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+NSArray_YUEJIE.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //测试数组是否越界
    NSArray * array =@[@"1",@"2"];
    NSLog(@"---------- %@", [array objectAtIndexCheck:3]);
    array.test= @"tets";//给NSArray 使用runtime添加的属性
    array.Testnum = 18;
    NSLog(@"%@ %ld",array.test,array.Testnum);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
