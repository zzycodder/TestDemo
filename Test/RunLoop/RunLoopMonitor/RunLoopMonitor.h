//
//  RunLoopMonitor.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/7/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunLoopMonitor : NSObject
+ (instancetype)shareInstance;
- (void)startMonitor;
@end
