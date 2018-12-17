//
//  HookTestVC+TwoHookMethod.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/16.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookTestVC+TwoHookMethod.h"
#import "HookTestVC.h"

@implementation HookTestVC (TwoHookMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SCC_HockInstanceMethod(self, @selector(viewDidLoad), @selector(TwoHock_viewDidLoad));
    });
}

- (void)hock_viewDidLoad {
    [self hock_viewDidLoad];
    NSLog(@"HookTestVC+TwoHookMethod");
}

- (void)TwoHock_viewDidLoad {
    [self TwoHock_viewDidLoad];
    NSLog(@"HookTestVC+TwoHookMethod");
}

@end
