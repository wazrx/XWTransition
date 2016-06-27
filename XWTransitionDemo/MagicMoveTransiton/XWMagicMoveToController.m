//
//  XWMagicMoveToController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/12.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWMagicMoveToController.h"

@interface XWMagicMoveToController ()
@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, strong) UIImage *img;
@end

@implementation XWMagicMoveToController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents = nil;
    UIImageView *imgView = [UIImageView new];
    imgView.frame = CGRectMake(10, 100, 150, 150);
    imgView.image = _img;
    [self.view addSubview:imgView];
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    view1.frame = CGRectMake(50, 400, 80, 80);
    view1.layer.cornerRadius = 40;
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor purpleColor];
    view2.frame = CGRectMake(200, 400, 75, 75);
    [self.view addSubview:view2];
    [self.button setTitle:@"点我或向上滑动" forState:UIControlStateNormal];
    [self xw_addMagicMoveEndViewGroup:@[imgView, view1, view2]];
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionUp transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transiton];
    } edgeSpacing:0];
}

- (void)xw_setImage:(UIImage *)img {
    _img = img;
}
@end
