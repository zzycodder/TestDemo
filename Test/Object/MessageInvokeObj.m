//
//  MessageInvokeObj.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/13.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "MessageInvokeObj.h"
#import <objc/runtime.h>
#import "InvokeMethodObj.h"

@implementation MessageInvokeObj

//- (void)doWork:(NSString *)string {
//    NSLog(@"doSomething.....");
//}

void doWork(id self, SEL cmd, NSString *work, NSArray *array) {
    NSLog(@"work = %@, array = %@", work, array);
}


+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString *selectorString = NSStringFromSelector(sel);
//    if ([selectorString isEqualToString:@"doWork:array:"]) {
//        class_addMethod(self, sel, (IMP)doWork, "v@:@:@");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSString *selString = NSStringFromSelector(aSelector);
//    if ([selString isEqualToString:@"doWork:array:"]) {
//        InvokeMethodObj *obj = [[InvokeMethodObj alloc] init];
//        return obj;
//    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *selString = NSStringFromSelector(aSelector);
    if ([selString isEqualToString:@"doWork:array:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    InvokeMethodObj *obj = [[InvokeMethodObj alloc] init];
//    if ([obj respondsToSelector:anInvocation.selector]) {
//        [anInvocation invokeWithTarget:obj];
//    }
}


@end
