//
//  MallocBlock.c
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/18.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#include <stdio.h>

int mainBlockdd() {
    
    void(^GlockBlock)(void) =  ^{
        printf("block test");
    };
    GlockBlock();
    
    
    
    return 0;
}
