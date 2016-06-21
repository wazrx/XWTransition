

//
//  XWFilterListControllerViewController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/17.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWFilterListControllerController.h"
#import "XWFilterFromController.h"

@interface XWFilterListControllerController ()

@end

@implementation XWFilterListControllerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FilterTransition";
    self.titleData = @[@"BoxBlur", @"Swipe", @"BarsSwipe", @"Mask", @"Flash", @"Mod", @"PageCurl", @"Ripple", @"CopyMachine"];
}

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath{
    XWFilterFromController *fVC = [XWFilterFromController new];
    fVC.type = indexPath.row;
    [self.navigationController pushViewController:fVC animated:YES];
}

@end
