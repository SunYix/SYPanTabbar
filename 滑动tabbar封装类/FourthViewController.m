//
//  FourthViewController.m
//  封装tabbar滑动切换
//
//  Created by 孙艺 on 17/5/22.
//  Copyright © 2017年 com.vleep.videomeet. All rights reserved.
//

#import "FourthViewController.h"

#define time 0.3f

@interface FourthViewController (){
    UIImageView *_imageviewLeft;
}

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加左右滑动手势pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:selectIndex:)];
    [self.view addGestureRecognizer:pan];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    /********用于创建pan********/       //将左右的vc页面预绘制出来
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    UIViewController* v1 = [self.tabBarController.viewControllers objectAtIndex:selectedIndex-1];
    UIImage* image1 = [self imageByCropping:v1.view toRect:v1.view.bounds];
    _imageviewLeft = [[UIImageView alloc] initWithImage:image1];
    _imageviewLeft.frame = CGRectMake(_imageviewLeft.frame.origin.x - [UIScreen mainScreen].bounds.size.width, _imageviewLeft.frame.origin.y , _imageviewLeft.frame.size.width, _imageviewLeft.frame.size.height);
    [self.view addSubview:_imageviewLeft];
    
    /********用于创建pan********/
}

- (void)viewDidDisappear:(BOOL)animated{
    /********用于移除pan时的左右两边的view********/
    [_imageviewLeft removeFromSuperview];
}

#pragma mark 绘制图片
//与pan结合使用 截图方法，图片用来做动画
-(UIImage*)imageByCropping:(UIView*)imageToCrop toRect:(CGRect)rect
{
       return [super imageByCropping:imageToCrop toRect:rect];
}

#pragma mark Pan手势
- (void) handlePan:(UIPanGestureRecognizer*)recongizer selectIndex:(NSInteger)selectIndex
{
    
       [super handlePan:recongizer selectIndex:self.tabBarController.selectedIndex];
}

@end
