//
//  StackBlock.c
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/18.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#include <stdio.h>

void StackBlockMain() {
    
    __block int a = 10;
    float c = 2.f;
    void(^StackBlock)(int b) =  ^(int b){
        a = 1;
        printf("%d\n", a + b );
        printf("%f\n", c);
    };
    
    StackBlock(3);
    
}

