//
//  NSOpreationQueueVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/20.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "NSOpreationQueueVC.h"
#import "UIButton+TestButton.h"

@interface NSOpreationQueueVC ()

@end

@implementation NSOpreationQueueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button1 = [UIButton buttonWithFrame:CGRectMake(100, 100, 150, 100) title:@"BlockOperation" target:self action:@selector(blockOperationAction)];
    UIButton *button2 = [UIButton buttonWithFrame:CGRectMake(100, 300, 150, 100) title:@"invocationOperation" target:self action:@selector(invocationOperationAction)];

    [self.view addSubview:button1];
}

- (void)blockOperationThread {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(synchronousOperation) object:nil];
    [thread start];
}

/**
 默认情况下，NSOperation是同步的，如果想实现异步，只能自定义一个子类去实现，或者用NSOperationQueue，将NSOperation加入到NSOperationQueue中，也可以实现异步执行。
 */
- (void)synchronousOperation {
    NSBlockOperation *operaion = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"operationBlock1");
        NSLog(@"operation1 Thread = %@", [NSThread currentThread]);
    }];
    [operaion addExecutionBlock:^{
        NSLog(@"operationBlock2");
        NSLog(@"operation2 Thread = %@", [NSThread currentThread]);
    }];

//    [operaion start];

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operaion];
    NSLog(@"synchronousOperation");
}

- (void)blockOperationAction {
    NSBlockOperation *operaion1 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"operation1");
        NSLog(@"operation1 Thread = %@", [NSThread currentThread]);
    }];
//    [operaion1 addExecutionBlock:^{
//        sleep(1);
//        NSLog(@"operation1 Block2");
//        NSLog(@"operation1 Block2 Thread = %@", [NSThread currentThread]);
//    }];
//    [operaion1 addExecutionBlock:^{
//        NSLog(@"operation1 Block3");
//        NSLog(@"operation1 Block3 Thread = %@", [NSThread currentThread]);
//    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"operation2");
        NSLog(@"operation2 Thread = %@", [NSThread currentThread]);
    }];
    
    [operation2 addDependency:operaion1];

    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    [queue1 addOperation:operaion1];

    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    [queue2 addOperation:operation2];
    
}

- (void)invocationOperationAction {
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperationAction:) object:@"zzy"];
    [operation start];
}

- (void)invocationOperationAction:(id)userInfo {
    NSLog(@"operation Thread = %@", [NSThread currentThread]);
    NSLog(@"userInfo = %@", userInfo);
}

@end
