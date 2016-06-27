//
//  XWPageFlipFromController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/13.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCoolFromController.h"
#import "XWCoolToController.h"
#import "XWCoolAnimator.h"


@implementation XWCoolFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *directionNames = @[@"左",@"右", @"左", @"下", @"上", @"下",@"右",@"左",@"下",@"左",@"下",@"右",@"左",@"下",@"上"];
    [self.button setTitle:[NSString stringWithFormat:@"点我或向%@滑动", directionNames[_type]] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(xw_transition) forControlEvents:UIControlEventTouchUpInside];
    __weak typeof(self)weakSelf = self;
    [self xw_registerToInteractiveTransitionWithDirection:[self xw_getDirectionWithName:directionNames[_type]] transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transition];
    } edgeSpacing:0];
}

- (void)xw_transition{
    XWCoolAnimator *animator = [XWCoolAnimator xw_animatorWithType:_type];
    animator.toDuration = 1.0f;
    animator.backDuration = 1.0f;
    XWCoolToController *toVC = [XWCoolToController new];
    toVC.type = _type;
    if (self.pushOrPresntSwitch.on) {
        [self.navigationController xw_pushViewController:toVC withAnimator:animator];
    }else{
        [self xw_presentViewController:toVC withAnimator:animator];
    }
}

- (NSInteger)xw_getDirectionWithName:(NSString *)name{
    NSArray *temp = @[@"左", @"右", @"上", @"下"];
    return [temp indexOfObject:name];
}

@end
