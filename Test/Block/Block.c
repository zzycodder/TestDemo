//
//  Block.c
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/18.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#include <stdio.h>

/**
struct __block_impl {
    void *isa;
    int Flags;      //用于按 bit 位表示一些 block 的附加信息
    int Reserved;   //保留变量
    void *FuncPtr;  //函数指针，指向具体的 block 实现的函数调用地址
};

//block的命名是以当前的方法名为开头(__mainBlock) + _block_impl_ + 在方法中的顺序（0）
struct __mainBlock_block_impl_0 {
    struct __block_impl impl;
    struct __mainBlock_block_desc_0* Desc;
    __mainBlock_block_impl_0(void *fp, struct __mainBlock_block_desc_0 *desc, int flags=0) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};

static void __mainBlock_block_func_0(struct __mainBlock_block_impl_0 *__cself) {
    printf("block test");
}

static struct __mainBlock_block_desc_0 {
    size_t reserved;
    size_t Block_size;
} __mainBlock_block_desc_0_DATA = {0, sizeof(struct __mainBlock_block_impl_0)};

int mainBlock() {
    
    void(*GlockBlock)(void) = ((void (*)())&__mainBlock_block_impl_0((void *)__mainBlock_block_func_0, &__mainBlock_block_desc_0_DATA));
    ((void (*)(__block_impl *))((__block_impl *)GlockBlock)->FuncPtr)((__block_impl *)GlockBlock);
    
    return 0;
}
*/

int blockMain() {
    
    void(^MyBlock)(void) =  ^{
            printf("block test");
        };
    MyBlock();

    return 0;
}
