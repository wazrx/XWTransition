//
//  XWMagicMoveToTwoController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/19.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWMagicMoveFromTwoController.h"
#import "XWMagicMoveToImageController.h"
#import "UIViewController+XWTransition.h"
#import "UINavigationController+XWTransition.h"
#import "XWMagicMoveAnimator.h"

@interface XWMagicMoveFromTwoController ()

@end

@implementation XWMagicMoveFromTwoController

- (void)dealloc{
    NSLog(@"toVC销毁了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < 9; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zrx%zd.jpg", i + 1]] forState:UIControlStateNormal];
        button.layer.contents = (__bridge id)[UIImage imageNamed:[NSString stringWithFormat:@"zrx%zd.jpg", i + 1]].CGImage;
                                              
        [button addTarget:self action:@selector(xw_clicked:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat spacing = 5;
        CGFloat edgeSpacing = 15;
        CGFloat width = (self.view.frame.size.width - (5 + 15) * 2) / 3.0f;
        CGFloat height = width;
        CGFloat x = edgeSpacing + (width + spacing) * (i % 3);
        CGFloat y = 100 + (height + spacing) * (i / 3);
        button.frame = CGRectMake(x, y, width, height);
        [self.view addSubview:button];
    }
    //注册神奇移动转场终止视图
    [self xw_addMagicMoveEndViewGroup:@[self.view.subviews[1]]];
    
}

- (void)xw_clicked:(UIButton *)sender{
    XWMagicMoveToImageController *imgVC = [XWMagicMoveToImageController new];
    imgVC.idx = [self.view.subviews indexOfObject:sender];
    __weak typeof(self)weakSelf = self;
    imgVC.dismissConfig = ^(NSInteger idx){
        [weakSelf xw_dismiss:idx];
    };
    //将点击的按钮注册为神奇移动转场开始视图
    [self xw_addMagicMoveStartViewGroup:@[sender]];
    XWMagicMoveAnimator *animator = [XWMagicMoveAnimator new];
//    animator.dampingEnable = YES;
//    animator.imageMode = YES;
    sender.magicMoveImageMode = YES;
    [self xw_presentViewController:imgVC withAnimator: animator];
}

- (void)xw_dismiss:(NSInteger)idx{
    //更改转场视图为collectionView滑动的视图
    [self xw_changeMagicMoveStartViewGroup:@[self.view.subviews[idx]]];
    //dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
