//
//  XWMagicMoveToImageController.h
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/19.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWMagicMoveToImageController : UIViewController

@property (nonatomic, assign) NSUInteger idx;

@property (nonatomic, copy) void(^dismissConfig)(NSInteger currentIndex);

@end
