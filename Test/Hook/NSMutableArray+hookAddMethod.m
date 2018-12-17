//
//  NSMutableArray+hookAddMethod.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "NSMutableArray+hookAddMethod.h"
#import "HookTestVC.h"

@implementation NSMutableArray (hookAddMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SCC_HockInstanceMethod([self class], @selector(addObject:), @selector(hook_addObject:));
    });
}

- (void)hook_addObject:(id)object {
    [self hook_addObject:object];
    NSLog(@"hook object = %@", object);
}

@end
