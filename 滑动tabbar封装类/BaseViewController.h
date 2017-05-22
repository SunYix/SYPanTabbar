//
//  BaseViewController.h
//  封装tabbar滑动切换
//
//  Created by 孙艺 on 17/5/22.
//  Copyright © 2017年 com.vleep.videomeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


-(UIImage*)imageByCropping:(UIView*)imageToCrop toRect:(CGRect)rect;

- (void) handlePan:(UIPanGestureRecognizer*)recongizer selectIndex:(NSInteger)selectIndex;

@end
