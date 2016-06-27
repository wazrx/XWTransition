//
//  XWCircleSpreadToController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/12.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCircleSpreadToController.h"

@implementation XWCircleSpreadToController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button setTitle:@"点我或向下滑动" forState:UIControlStateNormal];
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionDown transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transiton];
    } edgeSpacing:0];
}

@end
