//
//  HookTestVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/16.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookTestVC.h"

#import <objc/runtime.h>

#import "NSMutableArray+hookAddMethod.h"

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

@interface HookTestVC ()

@end

@implementation HookTestVC

+ (void)load {

}

+ (void)initialize {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"HookTestVC");

    [self coveredMethod];
    
    [self hookMutableArrayAddMethod];
}

- (void)coveredMethod {
    NSLog(@"主类的方法");
}

- (void)hookMutableArrayAddMethod {
//    NSMutableArray *arrayM = @[].mutableCopy;
//    [arrayM addObject:@"zzy"];
}

@end
