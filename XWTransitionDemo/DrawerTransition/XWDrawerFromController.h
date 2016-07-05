//
//  XWDrawerFromController.h
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/15.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWBasicFromController.h"

@interface XWDrawerFromController : XWBasicFromController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger type;

@end
