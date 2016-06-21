//
//  UINavigationController+XWTransition.m
//  XWTADemo
//
//  Created by wazrx on 16/6/7.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "UINavigationController+XWTransition.h"
#import "UIViewController+XWTransition.h"
#import "XWTransitionAnimator.h"
#import <objc/runtime.h>

@implementation UINavigationController (XWTransition)

- (void)xw_pushViewController:(UIViewController *)viewController withAnimator:(XWTransitionAnimator *)animator {
    if (!viewController) return;
    if (!animator) animator = [XWTransitionAnimator new];
    self.delegate = animator;
    XWInteractiveTransition *toInteractive = objc_getAssociatedObject(self.topViewController, &kXWToInteractiveKey);
    if (toInteractive) {
        [animator setValue:toInteractive forKey:@"toInteractive"];
    }
    objc_setAssociatedObject(viewController, &kXWAnimatorKey, animator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self pushViewController:viewController animated:YES];
}
@end
