//
//  ClickButton.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/15.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ClickButton.h"

@interface ClickButton ()
@property (nonatomic, copy) dispatch_block_t callback;

@end

@implementation ClickButton

- (UIButton *)initClickButtonWithFrame:(CGRect)frame
                             superView:(UIView *)superView
                              callback:(dispatch_block_t)callback {
    self = [ClickButton buttonWithType:UIButtonTypeSystem];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor orangeColor];
        [superView addSubview:self];
        [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchDown];
        self.callback = callback;
    }
    
    return self;
}

- (void)buttonAction {
    if (!self.callback) return;
    self.callback();
}

- (void)dealloc {
    NSLog(@"clickButton release....");
}

@end
