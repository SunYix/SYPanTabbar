//
//  BaseViewController.m
//  封装tabbar滑动切换
//
//  Created by 孙艺 on 17/5/22.
//  Copyright © 2017年 com.vleep.videomeet. All rights reserved.
//

#import "BaseViewController.h"

#define time 0.3f

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 绘制图片
//与pan结合使用 截图方法，图片用来做动画
-(UIImage*)imageByCropping:(UIView*)imageToCrop toRect:(CGRect)rect
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize pageSize = CGSizeMake(scale*rect.size.width, scale*rect.size.height) ;
    UIGraphicsBeginImageContext(pageSize);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), scale, scale);
    
    CGContextRef resizedContext =UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(resizedContext,-1*rect.origin.x,-1*rect.origin.y);
    [imageToCrop.layer renderInContext:resizedContext];
    UIImage*imageOriginBackground =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageOriginBackground = [UIImage imageWithCGImage:imageOriginBackground.CGImage scale:scale orientation:UIImageOrientationUp];
    
    return imageOriginBackground;
}


#pragma mark Pan手势
- (void) handlePan:(UIPanGestureRecognizer*)recongizer selectIndex:(NSInteger)selectIndex
{
    NSLog(@"UIPanGestureRecognizer");
    
    NSUInteger index = [self.tabBarController selectedIndex];
    
    CGPoint point = [recongizer translationInView:self.view];
    NSLog(@"%f,%f",point.x,point.y);
    
    if (selectIndex == 0) {
        if (recongizer.view.center.x + point.x >  [UIScreen mainScreen].bounds.size.width/2) {
            recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, recongizer.view.center.y);
        } else {
            recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
        }
        [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
        
        if (recongizer.state == UIGestureRecognizerStateEnded) {
            if (recongizer.view.center.x <= [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }completion:^(BOOL finished) {
                    
                }];
            } else if (recongizer.view.center.x <= 0 ){
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }completion:^(BOOL finished) {
                    [self.tabBarController setSelectedIndex:index+1];
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }];
            }
        }
    }else if (selectIndex + 1 == self.tabBarController.viewControllers.count){
        if (recongizer.view.center.x + point.x <  [UIScreen mainScreen].bounds.size.width/2) {
            recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, recongizer.view.center.y);
        } else {
            recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
        }
        [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
        
        if (recongizer.state == UIGestureRecognizerStateEnded) {
            if (recongizer.view.center.x <= [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x >= 0 ) {
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                    
                }completion:^(BOOL finished) {
                    
                }];
            } else if (recongizer.view.center.x <= 0 ){
                
            } else {
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width*1.5 ,[UIScreen mainScreen].bounds.size.height/2);
                }completion:^(BOOL finished) {
                    [self.tabBarController setSelectedIndex:index-1];
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }];
            }
        }
    }else{
        recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
        [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
        
        if (recongizer.state == UIGestureRecognizerStateEnded) {
            if (recongizer.view.center.x < [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }completion:^(BOOL finished) {
                    
                }];
            } else if (recongizer.view.center.x <= 0 ){
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }completion:^(BOOL finished) {
                    [self.tabBarController setSelectedIndex:index+1];
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }];
            } else {
                [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width*1.5 ,[UIScreen mainScreen].bounds.size.height/2);
                }completion:^(BOOL finished) {
                    [self.tabBarController setSelectedIndex:index-1];
                    recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
                }];
            }
        }
    }
}





@end
