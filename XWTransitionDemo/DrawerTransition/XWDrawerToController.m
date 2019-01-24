//
//  XWDrawerToController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/15.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWDrawerToController.h"
#import "XWCoolAnimator.h"

@implementation XWDrawerToController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *title = _type ? @"点我或向下滑动" : @"点我或向左滑动";
    [self.button setTitle:title forState:UIControlStateNormal];
    self.button.hidden = YES;
    XWInteractiveTransitionGestureDirection direction = _type ? XWInteractiveTransitionGestureDirectionDown : XWInteractiveTransitionGestureDirectionLeft;
    __weak typeof(self)weakSelf = self;
    XWInteractiveTransition *interactive = [self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transiton];
    } edgeSpacing:0];
    //添加惯性效果
    interactive.inertiaRatio = 0.7;
    interactive.inertiaDuration = 0.7;
}

@end
