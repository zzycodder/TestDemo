//
//  HookTestVC+OneHookMethod.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/16.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookTestVC+OneHookMethod.h"
#import "ViewController+HockMethod.h"

@implementation HookTestVC (OneHookMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SCC_HockInstanceMethod(self, @selector(viewDidLoad), @selector(hock_viewDidLoad));
    });
}

- (void)hock_viewDidLoad {
    //    [self hock_viewDidLoad];
    NSLog(@"HookTestVC+TwoHookMethod");
}

- (void)OneHock_viewDidLoad {
//    [self hock_viewDidLoad];
    NSLog(@"HookTestVC+OneHookMethod");
}

@end
