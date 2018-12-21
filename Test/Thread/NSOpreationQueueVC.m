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
    
    UIButton *button1 = [UIButton buttonWithFrame:CGRectMake(100, 100, 150, 100) title:@"BlockOperation" target:self action:@selector(blockOperationThread)];
    UIButton *button2 = [UIButton buttonWithFrame:CGRectMake(100, 300, 150, 100) title:@"invocationOperation" target:self action:@selector(invocationOperationAction)];

    [self.view addSubview:button1];
    [self.view addSubview:button2];
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
        NSLog(@"operation1 Thread = %@", [NSThread currentThread]);
    }];
    [operaion addExecutionBlock:^{
        NSLog(@"operation2");
        NSLog(@"operation2 Thread = %@", [NSThread currentThread]);
    }];
    NSLog(@"%@", [NSNumber numberWithBool:operaion.isAsynchronous]);
//    [operaion start];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operaion];
    NSLog(@"synchronousOperation....");
}

- (void)blockOperationAction {
    NSBlockOperation *operaion = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"operation1");
        NSLog(@"operation1 Thread = %@", [NSThread currentThread]);
    }];
    [operaion addExecutionBlock:^{
        NSLog(@"operation2");
        NSLog(@"operation2 Thread = %@", [NSThread currentThread]);
    }];
    [operaion addExecutionBlock:^{
        NSLog(@"operation3");
        NSLog(@"operation3 Thread = %@", [NSThread currentThread]);
    }];
   
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperation2 Thread = %@", [NSThread currentThread]);
        NSLog(@"NSBlockOperation2");
    }];
    
    [operation2 addDependency:operaion];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation2];
    
    [queue addOperation:operaion];

//    [operaion start];
    [operation2 start];

    
//    NSLog(@"ExecutionBlocks = %@", operaion.executionBlocks);
}

- (void)invocationOperationAction {
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperation:) object:@"zzy"];
    [operation start];
}

- (void)invocationOperation:(id)userInfo {
    NSLog(@"operation Thread = %@", [NSThread currentThread]);
    NSLog(@"userInfo = %@", userInfo);
}

@end
