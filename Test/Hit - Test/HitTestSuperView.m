//
//  HitTestSuperView.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/7/30.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HitTestSuperView.h"

@implementation HitTestSuperView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    
//    if ([self pointInside:point withEvent:event]) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *view = [subView hitTest:convertedPoint withEvent:event];
            if (view) {
                return view;
            }
        }
        return self;
//    }
    return nil;
}

@end
