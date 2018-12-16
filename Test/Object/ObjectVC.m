//
//  ObjectVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/13.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ObjectVC.h"
#import "MessageInvokeObj.h"

@interface ObjectVC ()

@end

@implementation ObjectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MessageInvokeObj *obj = [[MessageInvokeObj alloc] init];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [obj performSelector:@selector(doWork:array:) withObject:@"somthing" withObject:@[@"work"]];
//    [obj performSelector:@selector(invokeMethod)];
    
#pragma clang diagnostic pop
    
//    [self performSelector:@selector(doSomething:b:c:) withObject:@"adf" withObject:@1];

    NSNumber *string = [self messageInvoke];
    
    NSLog(@"string = %@", string);
}

- (id)messageInvoke {
    SEL selector = @selector(messageSendWithObject:obj2:);
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    
//    Class cls = [self class];
    
    NSString *param1 = @"zhangzhongyang";
    NSDictionary *dic = @{@"key":@"value"};
    [invocation setArgument:(void *)&param1 atIndex:2];
    [invocation setArgument:(void *)&dic atIndex:3];
    
    [invocation retainArguments];
    [invocation invoke];
    
    NSUInteger length = sig.methodReturnLength;
    NSString *type = [NSString stringWithUTF8String:sig.methodReturnType];
    if (length > 0 && [type isEqualToString:@"@"]) {
        void *returnObj;
        [invocation getReturnValue:&returnObj];
        return (__bridge id)returnObj;
    }
    return 0;
}

- (void)doSomething:(NSString *)a b:(id)b c:(NSArray *)c {
    NSLog(@"do something....");
}


- (id)messageSendWithObject:(NSString *)obj1 obj2:(NSDictionary *)obj2 {
    NSLog(@"obj2 = %@", obj2);
    return @12;
}


@end
