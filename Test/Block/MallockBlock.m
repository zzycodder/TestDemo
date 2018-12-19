//
//  MallockBlock.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/19.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "MallockBlock.h"

@implementation MallockBlock

void blockMain() {

    NSObject *obj = [NSObject new];
    __block NSObject *obj1 = obj;

    void(^MyBlock)(void) =  ^{
        obj1 = [[NSObject alloc] init];
        NSLog(@"%@", obj1);
    };
    
    void(^Block)(int a) =  ^(int a){
        NSLog(@"%d", a);
    };
    
    void(^copyBlock)(void) = [MyBlock copy];
    
    copyBlock();
    Block(1);
}


@end
