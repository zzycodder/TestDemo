//
//  HookTestVC.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/16.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

void SCC_HockInstanceMethod (Class _Nullable class, SEL _Nonnull orginSelector, SEL _Nonnull swizzledSelector);

@interface HookTestVC : UIViewController

@end
