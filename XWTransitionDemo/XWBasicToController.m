//
//  XWBasicToController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWBasicToController.h"

@interface XWBasicToController ()

@end

@implementation XWBasicToController

- (void)dealloc{
    NSLog(@"toVC销毁了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"p2.JPG"].CGImage;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button = button;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 30);
    button.bounds = CGRectMake(0, 0, 100, 30);
    [button addTarget:self action:@selector(xw_transiton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)xw_transiton{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
