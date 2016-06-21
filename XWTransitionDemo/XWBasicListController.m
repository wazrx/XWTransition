//
//  XWBasicListController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWBasicListController.h"

@interface XWBasicListController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation XWBasicListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *mainView = [UITableView new];
    mainView.delegate = self;
    mainView.dataSource = self;
    mainView.frame = self.view.bounds;
    mainView.backgroundColor = [UIColor whiteColor];
    _mainView = mainView;
    [self.view addSubview:mainView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xwtransition"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xwtransition"];
    }
    cell.textLabel.text = _titleData[indexPath.row];
    [self xw_configCell:cell indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self xw_selectCellAtIndexPath:indexPath];
}

- (void)xw_configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
	
}

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath {
	
}



@end
