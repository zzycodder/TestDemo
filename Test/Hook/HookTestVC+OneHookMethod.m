//
//  HookTestVC+OneHookMethod.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/16.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookTestVC+OneHookMethod.h"
#import "HookTestVC.h"

@implementation HookTestVC (OneHookMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SCC_HockInstanceMethod(self, @selector(viewDidLoad), @selector(OneHock_viewDidLoad));
    });
}

/**
 OC不支持方法重载，一个类的方法列表中不能存在两个相同的SEL，如果两个分类categoryA和categoryB都实现了同一个方法对主类的方法进行替换，那么categoryA和categoryB的方法都不会被执行，只会执行主类的方法。如果其他的分类例如categoryC这个时候也替换了主类的同样方法，但是用的是不同的方法名，那么categoryC的方法是可以执行的。
 */
- (void)hock_viewDidLoad {
    //    [self hock_viewDidLoad];
    NSLog(@"HookTestVC+OneHookMethod");
}

- (void)OneHock_viewDidLoad {
    [self OneHock_viewDidLoad];
    NSLog(@"HookTestVC+OneHookMethod");
}

@end
