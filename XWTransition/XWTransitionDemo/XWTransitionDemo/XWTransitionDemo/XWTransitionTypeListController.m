//
//  ViewController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/9.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWTransitionTypeListController.h"

@implementation XWTransitionTypeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"transitionList";
    self.titleData = @[@"CircleSpreadTransition", @"MagicMoveTransition", @"CoolTransition", @"DrawerTransition", @"FilterTransition"];
}

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *controllerNames = @[@"XWCircleSpreadFromController", @"XWMagicMoveListController", @"XWCoolTypeListController", @"XWDrawerTypeListController", @"XWFilterListControllerController"];
    UIViewController *pushVC = [NSClassFromString(controllerNames[indexPath.row]) new];
    pushVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pushVC animated:YES];
}

@end
