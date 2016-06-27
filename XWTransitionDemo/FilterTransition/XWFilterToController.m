
//
//  XWFilterToController.m
//  XWTransitionDemo
//
//  Created by wazrx on 16/6/17.
//  Copyright © 2016年 wazrx. All rights reserved.
//

#import "XWFilterToController.h"

@interface XWFilterToController ()

@end

@implementation XWFilterToController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *directionNames = @[@"上",@"左",@"左", @"上", @"上", @"上", @"左", @"左", @"左"];
    [self.button setTitle:[NSString stringWithFormat:@"点我或向%@滑动", directionNames[_type]] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(xw_transiton) forControlEvents:UIControlEventTouchUpInside];
    __weak typeof(self)weakSelf = self;
    [self xw_registerBackInteractiveTransitionWithDirection:[self xw_getDirectionWithName:directionNames[_type]] transitonBlock:^(CGPoint startPoint){
        [weakSelf xw_transiton];
    } edgeSpacing:0];
}

- (NSInteger)xw_getDirectionWithName:(NSString *)name{
    NSArray *temp = @[@"左", @"右", @"上", @"下"];
    return [temp indexOfObject:name];
}

@end
