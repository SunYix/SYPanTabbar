//
//  TransitionHelper.m
//  封装tabbar滑动切换
//
//  Created by 孙艺 on 17/5/22.
//  Copyright © 2017年 com.vleep.videomeet. All rights reserved.
//

#import "TransitionHelper.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"


@interface TransitionHelper ()

@end

@implementation TransitionHelper

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  lifeCycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

+ (void)initViews{
    UIWindow *window = (UIWindow *)[UIApplication sharedApplication].delegate.window;
    
    //first
    FirstViewController *first = [[FirstViewController alloc] init];
    first.view.backgroundColor = [UIColor yellowColor];
    first.title = @"first";
    
    //second
    SecondViewController *second = [[SecondViewController alloc] init];
    second.view.backgroundColor  = [UIColor greenColor];
    second.title = @"second";
    
    //third
    ThirdViewController *third = [[ThirdViewController alloc] init];
    third.view.backgroundColor = [UIColor blueColor];
    third.title = @"third";
    
    
    //fourth
    FourthViewController *fourth = [[FourthViewController alloc] init];
    fourth.view.backgroundColor  = [UIColor grayColor];
    fourth.title = @"fourth";
    
    
    UITabBarController *tabbarController = [self new];
    tabbarController.viewControllers = @[first,second,third,fourth];
    
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    window.rootViewController = mainNav;
    
    [mainNav setNavigationBarHidden:YES];
}

# pragma mark  UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
   
    
}


@end
