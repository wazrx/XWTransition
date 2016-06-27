
//
//  XWFilterFromController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/17.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWFilterFromController.h"
#import "XWFilterToController.h"
#import "XWFilterAnimator.h"

@interface XWFilterFromController ()

@end

@implementation XWFilterFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *directionNames = @[@"下",@"右", @"右", @"下", @"下", @"下", @"右", @"右", @"右"];
    [self.button setTitle:[NSString stringWithFormat:@"点我或向%@滑动", directionNames[_type]] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(xw_transition) forControlEvents:UIControlEventTouchUpInside];
    __weak typeof(self)weakSelf = self;
    [self xw_registerToInteractiveTransitionWithDirection:[self xw_getDirectionWithName:directionNames[_type]] transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transition];
    } edgeSpacing:0];
}

- (void)xw_transition{
    XWFilterAnimator *animator = [XWFilterAnimator xw_animatorWithType:_type];
    XWFilterToController *toVC = [XWFilterToController new];
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
