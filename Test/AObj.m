//
//  AObj.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/6/30.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "AObj.h"
#import <objc/runtime.h>

@implementation AObj

+ (void)load {
//    NSLog(@"Aobj load size = %zd", class_getInstanceSize(self));
}

//- (void)setName:(NSString *)name {
//    NSLog(@"name = %@", name);
//    _name = name;
//}

- (void)dealloc {
    NSLog(@"AObj dealloc");
}

@end
