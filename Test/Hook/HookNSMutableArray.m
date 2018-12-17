//
//  HookNSMutableArray.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookNSMutableArray.h"
#import <objc/runtime.h>

@implementation HookNSMutableArray


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class originClass = NSClassFromString(@"__NSArrayM");
        SEL originSEL = @selector(addObject:);
        Method originMethod = class_getInstanceMethod(originClass, originSEL);
        IMP originIMP = method_getImplementation(originMethod);
        
        Class swizzledClass = self;
        SEL swizzledSEL = @selector(hook_addObject:);
        Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSEL);
        IMP swizzledIMP = method_getImplementation(swizzledMethod);
        
        BOOL registerMethod = class_addMethod(originClass, swizzledSEL, swizzledIMP, method_getTypeEncoding(swizzledMethod));
        if (!registerMethod) return;
    
        
        swizzledMethod = class_getInstanceMethod(originClass, swizzledSEL);
        
        BOOL didAddMethod = class_addMethod(originClass, originSEL, swizzledIMP, method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(originClass, swizzledSEL, originIMP, method_getTypeEncoding(originMethod));
        }else {
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}

- (void)hook_addObject:(id)object {
    [self hook_addObject:object];
    NSLog(@"hook object = %@", object);
}


@end
