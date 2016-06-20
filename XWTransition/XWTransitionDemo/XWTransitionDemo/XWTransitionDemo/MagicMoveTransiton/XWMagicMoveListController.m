//
//  XWMagicMoveListController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/12.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWMagicMoveListController.h"
#import "XWMagicMoveFromController.h"
#import "XWMagicMoveFromTwoController.h"
#import "XWMagicMoveAnimator.h"

@implementation XWMagicMoveListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"magicTypeList";
    self.titleData = @[@"test1",@"test2"];
    self.mainView.rowHeight = 65;
}

- (void)xw_configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    NSArray *imgs = @[@"zrx1.jpg", @"zrx2.jpg"];
    cell.imageView.image = [UIImage imageNamed:imgs[indexPath.row]];
}

- (void)xw_selectCellAtIndexPath:(NSIndexPath *)indexPath{
    UIImageView  *imgView = [self.mainView cellForRowAtIndexPath:indexPath].imageView;
    [self xw_addMagicMoveStartViewGroup:@[imgView]];
    XWMagicMoveAnimator *animator = [XWMagicMoveAnimator new];
    animator.dampingEnable = YES;
    animator.imageMode = YES;
    animator.toDuration = 0.5f;
    animator.backDuration = 0.5f;
    if (indexPath.row == 0) {
        XWMagicMoveFromController *fromVC = [XWMagicMoveFromController new];
        [fromVC xw_setImage:imgView.image];
        [self.navigationController xw_pushViewController:fromVC withAnimator:animator];
        return;
    }
    if (indexPath.row == 1) {
        XWMagicMoveFromTwoController *fromTwoVC = [XWMagicMoveFromTwoController new];
        [self.navigationController xw_pushViewController:fromTwoVC withAnimator:animator];
    }
}

@end
