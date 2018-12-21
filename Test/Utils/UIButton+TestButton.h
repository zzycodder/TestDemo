//
//  UIButton+TestButton.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/21.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TestButton)

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                       target:(id)target
                       action:(SEL)action;

@end
