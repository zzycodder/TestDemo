//
//  ClickButton.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/15.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClickButton : UIButton

- (UIButton *)initClickButtonWithFrame:(CGRect)frame
                             superView:(UIView *)superView
                              callback:(dispatch_block_t)callback;

@end
