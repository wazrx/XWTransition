//
//  XWMagicMoveToImageController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/19.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWMagicMoveToImageController.h"
#import "UIViewController+XWTransition.h"

@interface XWMagicMoveToImageController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *mainView;
@property (nonatomic, weak) UIView *tempView;
@end

@implementation XWMagicMoveToImageController

- (void)dealloc{
    NSLog(@"toVC销毁了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xw_initailizeUI];
    //根据点击的idx设置collectionView的滚动位置
    [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_idx inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    //注意：由于在转场过程中cell还没有加载，所以无法注册cell为神奇移动视图，这种情况需要生产一个零时视图注册为转场视图来使用
    //下面创建一个零时的转场视图
    UIView *tempView = [UIView new];
    tempView.layer.contents = (__bridge id)[UIImage imageNamed:[NSString stringWithFormat:@"zrx%zd.jpg", _idx + 1]].CGImage;
    [self.view addSubview:tempView];
    _tempView = tempView;
    //配置tempView的图片和位置和cell完全重合
    tempView.center = self.view.center;
    tempView.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    //将该零时视图注册为神奇移动结束视图
    [self xw_addMagicMoveEndViewGroup:@[tempView]];
    //隐藏collectionView
    _mainView.hidden = YES;
    __weak typeof(self)weakSelf = self;
    //注册back手势，左滑动黑色部分可以back
    [self xw_registerBackInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionLeft transitonBlock:^(CGPoint startPoint){
        [weakSelf collectionView:weakSelf.mainView didSelectItemAtIndexPath:[weakSelf.mainView indexPathsForVisibleItems].firstObject];
    } edgeSpacing:0];
}

#pragma mark - initialize methods

- (void)xw_initailizeUI{
    self.view.backgroundColor = [UIColor blackColor];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    mainView.backgroundColor = [UIColor blackColor];
    _mainView = mainView;
    mainView.pagingEnabled = YES;
    mainView.delegate = self;
    mainView.dataSource = self;
    [mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"xw_XWMagicMoveToImageController_cell"];
    [self.view addSubview:mainView];
    mainView.center = self.view.center;
    mainView.bounds = CGRectMake(0, 0, layout.itemSize.width, layout.itemSize.height);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //转场结束后，我们需要隐藏零时视图，同时显示collectionView，转场完成
    _mainView.hidden = NO;
    _tempView.hidden = YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"xw_XWMagicMoveToImageController_cell" forIndexPath:indexPath];
    cell.layer.contents = (__bridge id)[UIImage imageNamed:[NSString stringWithFormat:@"zrx%zd.jpg", indexPath.item + 1]].CGImage;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //back的时候，我们继续调出临时视图来转场，同时设置临时视图的图片为当前图片
    _tempView.hidden = NO;
    _mainView.hidden = YES;
    _tempView.layer.contents = (__bridge id)[UIImage imageNamed:[NSString stringWithFormat:@"zrx%zd.jpg", indexPath.item + 1]].CGImage;
    //将dismiss操作传递给presentingController，因为此时转场回去的视图已经改变,而且本来dismiss操作最好也应该有presentingController来完成
    if (_dismissConfig) {
        _dismissConfig(indexPath.item);
    }
}

@end
