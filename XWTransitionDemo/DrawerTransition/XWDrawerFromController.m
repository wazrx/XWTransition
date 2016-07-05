//
//  XWDrawerFromController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/15.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWDrawerFromController.h"
#import "XWDrawerToController.h"
#import "XWDrawerAnimator.h"

@implementation XWDrawerFromController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *title = _type ? @"点我或向上滑动" : @"点我或从边缘向右滑动";
    [self.button setTitle:title forState:UIControlStateNormal];
    __weak typeof(self)weakSelf = self;
    XWInteractiveTransitionGestureDirection direction = _type ? XWInteractiveTransitionGestureDirectionUp : XWInteractiveTransitionGestureDirectionRight;
    [self xw_registerToInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transition];
    } edgeSpacing:_type ? 0 : 80];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)xw_transition{
    XWDrawerAnimatorDirection direction = _type ? XWDrawerAnimatorDirectionBottom : XWDrawerAnimatorDirectionLeft;
    CGFloat distance = _type ? 450 : 250;
    XWDrawerAnimator *animator = [XWDrawerAnimator xw_animatorWithDirection:direction moveDistance:distance];
    animator.toDuration = 0.5;
    animator.backDuration = 0.5;
    if (_type) {
        animator.flipEnable = YES;
    }else{
        animator.parallaxEnable = YES;
    }
    XWDrawerToController *toVC = [XWDrawerToController new];
    toVC.type = _type;
    if (self.pushOrPresntSwitch.on) {
        [self.navigationController xw_pushViewController:toVC withAnimator:animator];
    }else{
        [self xw_presentViewController:toVC withAnimator:animator];
    }
    __weak typeof(self)weakSelf = self;
    [animator xw_enableEdgeGestureAndBackTapWithConfig:^{
        [weakSelf _xw_back];
    }];
}

- (void)_xw_back{
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
        cell.textLabel.text = @"测试";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了%zd", indexPath.row);
    [self xw_transition];
}

@end
