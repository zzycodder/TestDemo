//
//  ViewController+HockMethod.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/9/7.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ViewController.h"

void SCC_HockInstanceMethod (Class _Nullable class, SEL _Nonnull orginSelector, SEL _Nonnull swizzledSelector);

@interface ViewController (HockMethod)

@end
