//
//  XWDrawerTypeListController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/15.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWDrawerTypeListController.h"
#import "XWDrawerFromController.h"

@implementation XWDrawerTypeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"DrawertypeList";
    self.titleData = @[@"drawerLeft(仿QQ)",@"drawerBottom(仿淘宝)"];
}

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath{
    XWDrawerFromController *fVC = [XWDrawerFromController new];
    fVC.type = indexPath.row;
    [self.navigationController pushViewController:fVC animated:YES];
}

@end
