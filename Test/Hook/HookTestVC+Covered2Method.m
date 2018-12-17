//
//  HookTestVC+Covered2Method.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HookTestVC+Covered2Method.h"

@implementation HookTestVC (Covered2Method)

+ (void)load {
    
}

+ (void)initialize {
    
}

/**
 1. 如果分类实现了和主类同样的方法，会覆盖主类的方法（load方法除外）
 2. 如果两个不同的分类都实现了和主类同样的方法，那么会执行后编译的分类的方法（跟编译顺序有关，后加入的分类添加的方法加在在方法列表的前面，所以会先执行）
 3. 如果分类实现了`load`方法，并不会覆盖主类的`load`方法，会先执行主类的`load`方法然后再执行分类的`load`方法（按照编译顺序）
 4. 如果分类实现了`initialize`方法，会覆盖主类的`initialize`方法
 */

- (void)coveredMethod {
    NSLog(@"分类2的方法");
}

@end
