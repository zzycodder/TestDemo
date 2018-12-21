//
//  NSThreadVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/20.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "NSThreadVC.h"

@interface NSThreadVC ()

@end

@implementation NSThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(doThead1:) object:@"zzy"];
    [thread1 setName:@"zzy"];
    [thread1 start];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRepeatAction:) userInfo:@{@"id":@"zzy"} repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    [timer fire];

}

#pragma mark - Action

- (void)doThead1:(NSString *)object {
    NSLog(@"object = %@", object);
    NSLog(@"thread = %@", [NSThread currentThread]);
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRepeatAction:) userInfo:@{@"id":@"zzy"} repeats:YES];
    [timer fire];
    [[NSRunLoop currentRunLoop] run];

}

- (void)timerRepeatAction:(NSTimer *)timer {
    NSLog(@"timer = %@", timer);
    [NSThread exit];
}

@end
