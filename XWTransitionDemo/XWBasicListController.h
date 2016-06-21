//
//  XWBasicListController.h
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWBasicListController : UIViewController
@property (nonatomic, copy) NSArray *titleData;
@property (nonatomic, weak,readonly) UITableView *mainView;

- (void)xw_configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath;

@end
