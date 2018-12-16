//
//  HitTestButton.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/7/30.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HitTestButton.h"

@implementation HitTestButton


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return CGRectContainsPoint(HitTestBounds(self.bounds, self.clickWidth, self.clickHeight), point);
}

CGRect HitTestBounds(CGRect bounds, CGFloat width, CGFloat height) {
    CGRect hitTestBounds = bounds;
    if (width > bounds.size.width) {
        hitTestBounds.size.width = width;
        hitTestBounds.origin.x -= (width - hitTestBounds.size.width) / 2;
    }
    if (height > bounds.size.height) {
        hitTestBounds.size.height = height;
        hitTestBounds.origin.y -= (height - hitTestBounds.size.height) / 2;
    }
    return hitTestBounds;
}

@end

