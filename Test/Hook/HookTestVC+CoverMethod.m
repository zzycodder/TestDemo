//
//  HookTestVC+CoverMethod.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookTestVC+CoverMethod.h"

@implementation HookTestVC (CoverMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        SCC_HockInstanceMethod(self, @selector(viewDidLoad), @selector(CoverHock_viewDidLoad));
    });
}

+ (void)initialize {
    
}


- (void)CoverHock_viewDidLoad {
    [self CoverHock_viewDidLoad];
    NSLog(@"CoverHock_viewDidLoad");
}

- (void)coveredMethod {
    NSLog(@"分类的方法");
}

@end
