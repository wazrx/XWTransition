//
//  XWCoolAnimator+XWPortal.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWCoolAnimator+XWPortal.h"

@implementation XWCoolAnimator (XWPortal)


- (void)xw_setPortalToAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    UIView *containerView = [transitionContext containerView];
    UIView *toViewSnapshot = [toView snapshotViewAfterScreenUpdates:YES];
    CATransform3D scale = CATransform3DIdentity;
    toViewSnapshot.layer.transform = CATransform3DScale(scale, 0.8, 0.8, 1);
    [containerView addSubview:toViewSnapshot];
    [containerView sendSubviewToBack:toViewSnapshot];
    CGRect leftSnapshotRegion = CGRectMake(0, 0, fromView.frame.size.width / 2, fromView.frame.size.height);
    UIView *leftHandView = [fromView resizableSnapshotViewFromRect:leftSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    leftHandView.frame = leftSnapshotRegion;
    [containerView addSubview:leftHandView];
    CGRect rightSnapshotRegion = CGRectMake(fromView.frame.size.width / 2, 0, fromView.frame.size.width / 2, fromView.frame.size.height);
    UIView *rightHandView = [fromView resizableSnapshotViewFromRect:rightSnapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    rightHandView.frame = rightSnapshotRegion;
    [containerView addSubview:rightHandView];
    fromView.hidden = YES;
    [UIView animateWithDuration:self.toDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         leftHandView.frame = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
                         rightHandView.frame = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
                         toViewSnapshot.center = toView.center;
                         toViewSnapshot.frame = toView.frame;
                     } completion:^(BOOL finished) {
                         fromView.hidden = NO;
                         if ([transitionContext transitionWasCancelled]) {
                             [containerView addSubview:fromView];
                             [self _xw_removeOtherViews:fromView];
                         } else {
                             [containerView addSubview:toView];
                             [self _xw_removeOtherViews:toView];
                         }
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

- (void)xw_setPortalBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromView];
    toView.frame = [transitionContext finalFrameForViewController:toVC];
    toView.frame = CGRectOffset(toView.frame, toView.frame.size.width, 0);
    [containerView addSubview:toView];
    CGRect leftSnapshotRegion = CGRectMake(0, 0, toView.frame.size.width / 2, toView.frame.size.height);
    UIView *leftHandView = [toView resizableSnapshotViewFromRect:leftSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    leftHandView.frame = leftSnapshotRegion;
    leftHandView.frame = CGRectOffset(leftHandView.frame, - leftHandView.frame.size.width, 0);
    [containerView addSubview:leftHandView];
    CGRect rightSnapshotRegion = CGRectMake(toView.frame.size.width / 2, 0, toView.frame.size.width / 2, toView.frame.size.height);
    UIView *rightHandView = [toView resizableSnapshotViewFromRect:rightSnapshotRegion  afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    rightHandView.frame = rightSnapshotRegion;
    rightHandView.frame = CGRectOffset(rightHandView.frame, rightHandView.frame.size.width, 0);
    [containerView addSubview:rightHandView];
    [UIView animateWithDuration:self.backDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         leftHandView.frame = CGRectOffset(leftHandView.frame, leftHandView.frame.size.width, 0);
                         rightHandView.frame = CGRectOffset(rightHandView.frame, - rightHandView.frame.size.width, 0);
                         CATransform3D scale = CATransform3DIdentity;
                         fromView.layer.transform = CATransform3DScale(scale, 0.8, 0.8, 1);
                     } completion:^(BOOL finished) {
                         if ([transitionContext transitionWasCancelled]) {
                             [self _xw_removeOtherViews:fromView];
                         } else {
                             [self _xw_removeOtherViews:toView];
                             toView.frame = containerView.bounds;
                         }
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

- (void)_xw_removeOtherViews:(UIView*)viewToKeep {
    UIView *containerView = viewToKeep.superview;
    for (UIView *view in containerView.subviews) {
        if (view != viewToKeep) {
            [view removeFromSuperview];
        }
    }
}
@end
