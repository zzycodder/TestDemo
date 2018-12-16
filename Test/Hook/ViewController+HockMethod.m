//
//  ViewController+HockMethod.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/9/7.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ViewController+HockMethod.h"
#import <objc/runtime.h>

inline void SCC_HockInstanceMethod (Class _Nullable class, SEL _Nonnull orginSelector, SEL _Nonnull swizzledSelector) {
    Method orginMethod = class_getInstanceMethod(class, orginSelector);
    IMP orginIMP = method_getImplementation(orginMethod);
    
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    
    BOOL addInstanceMethod = class_addMethod(class, orginSelector, swizzledIMP, method_getTypeEncoding(swizzledMethod));
    if (addInstanceMethod) {
        class_replaceMethod(class, swizzledSelector, orginIMP, method_getTypeEncoding(orginMethod));
    }else {
        method_exchangeImplementations(orginMethod, swizzledMethod);
    }
}

@implementation ViewController (HockMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SCC_HockInstanceMethod(self, @selector(viewDidLoad), @selector(hock_viewDidLoad));
    });
}

- (void)hock_viewDidLoad {
    self.title = @"Hock title";
    self.view.backgroundColor = [UIColor orangeColor];
}

@end
