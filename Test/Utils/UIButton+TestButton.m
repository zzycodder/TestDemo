//
//  UIButton+TestButton.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/21.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "UIButton+TestButton.h"

@implementation UIButton (TestButton)

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                       target:(id)target
                       action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor redColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    
    return button;
}


@end
