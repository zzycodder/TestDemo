//
//  CustomView.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/25.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver:self forKeyPath:@"focused" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"canBecomeFocused" options:NSKeyValueObservingOptionNew context:nil];

        [self addGesture];
    }
    return self;
}

- (void)addGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
}

- (void)tapAction {
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"focused"]) {
        NSLog(@"---%@", change);
        
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"focused" context:nil];
}

@end
