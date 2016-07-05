//
//  XWCoolTypeListController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/13.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCoolTypeListController.h"
#import "XWCoolFromController.h"
#import "XWCoolAnimator.h"

@implementation XWCoolTypeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CooltypeList";
    self.titleData = @[@"PageFlip",@"MiddleFlipFromLeft",@"MiddleFlipFromRight",@"MiddleFlipFromTop",@"MiddleFlipFromBottom",@"Portal",@"FoldFromLeft",@"FoldFromRight", @"Explode", @"HorizontalLines", @"VerticalLines",@"ScanningFromLeft",@"ScanningFromRight",@"ScanningFromTop",@"ScanningFromBottom"];
}

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath{
    XWCoolFromController *fVC = [XWCoolFromController new];
    fVC.type = indexPath.row;
    [self.navigationController pushViewController:fVC animated:YES];
}

@end
