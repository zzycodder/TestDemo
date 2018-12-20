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
    [thread1 start];
}

#pragma mark - Action

- (void)doThead1:(NSThread *)sender {
    NSLog(@"sender = %@", sender);
}

@end
