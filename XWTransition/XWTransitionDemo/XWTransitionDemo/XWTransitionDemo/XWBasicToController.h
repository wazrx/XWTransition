//
//  XWBasicToController.h
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/16.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+XWTransition.h"
#import "UIViewController+XWTransition.h"

@interface XWBasicToController : UIViewController
@property (nonatomic, weak, readonly) UIButton *button;

- (void)xw_transiton;

@end
