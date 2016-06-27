//
//  XWMagicMoveFromController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/12.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWMagicMoveFromController.h"
#import "XWMagicMoveToController.h"
#import "XWMagicMoveAnimator.h"
#import "UIViewController+XWTransition.h"
#import "UINavigationController+XWTransition.h"

@interface XWMagicMoveFromController ()

@property (nonatomic, strong) UIImage *img;

@end

@implementation XWMagicMoveFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents = nil;
    UIImageView *imgView = [UIImageView new];
    imgView.center = CGPointMake(self.view.center.x, 170);
    imgView.bounds = CGRectMake(0, 0, 200, 200);
    imgView.image = _img;
    [self.view addSubview:imgView];
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    view1.frame = CGRectMake(50, 300, 50, 50);
    view1.layer.cornerRadius = 25;
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor purpleColor];
    view2.frame = CGRectMake(250, 300, 75, 75);
    [self.view addSubview:view2];
    
    [self.button setTitle:@"点我或向下滑动" forState:UIControlStateNormal];
    //注册神奇移动前视图
    [self xw_addMagicMoveEndViewGroup:@[imgView]];
    [self xw_addMagicMoveStartViewGroup:@[imgView, view1, view2]];
    __weak typeof(self)weakSelf = self;
    [self xw_registerToInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionDown transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transition];
    } edgeSpacing:0];
}

- (void)xw_setImage:(UIImage *)img {
    _img = img;
}

- (void)xw_transition{
    XWMagicMoveToController *toVC = [XWMagicMoveToController new];
    [toVC xw_setImage:_img];
    XWMagicMoveAnimator *animator = [XWMagicMoveAnimator new];
    animator.toDuration = animator.backDuration = 0.5;
    if (self.pushOrPresntSwitch.on) {
        [self.navigationController xw_pushViewController:toVC withAnimator:animator];
    }else{
        [self xw_presentViewController:toVC withAnimator:animator];
    }
}

@end
