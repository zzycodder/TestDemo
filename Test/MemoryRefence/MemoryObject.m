//
//  MemoryObject.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/25.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "MemoryObject.h"

@implementation MemoryObject

- (void)dealloc {
    NSLog(@"MemoryObject 被释放");
}

@end
