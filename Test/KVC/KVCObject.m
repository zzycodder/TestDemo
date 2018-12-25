//
//  KVCObject.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/25.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "KVCObject.h"

@implementation KVCObject

- (void)setName:(NSString *)name {
    _name = name;
}

- (void)setNumber:(NSInteger)number {
    _number = number;
}

- (void)setNilValueForKey:(NSString *)key {
    
}


- (BOOL)isMan {
    return YES;
}

- (int)age {
    return 10;
}

@end
