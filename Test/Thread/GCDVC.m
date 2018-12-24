//
//  GCDVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/20.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "GCDVC.h"
#import "UIButton+TestButton.h"

@interface GCDVC ()

@end

@implementation GCDVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [UIButton buttonWithFrame:CGRectMake(100, 100, 150, 100) title:@"dispathGroup" target:self action:@selector(dispathGroup)];
    UIButton *button2 = [UIButton buttonWithFrame:CGRectMake(100, 250, 150, 100) title:@"dispatchSemaphore" target:self action:@selector(dispatchSemaphoreArray)];
    UIButton *button3 = [UIButton buttonWithFrame:CGRectMake(100, 400, 150, 100) title:@"dispatchSemaphoreGroup" target:self action:@selector(dispatchSemaphoreGroup)];

    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
}

- (void)dispathGroup {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t defaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t highQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_group_enter(group);
    dispatch_async(defaultQueue, ^{
        sleep(2);
        NSLog(@"任务一");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(defaultQueue, ^{
        sleep(2);
        //        dispatch_group_leave(group);
        NSLog(@"任务二");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(highQueue, ^{
        NSLog(@"高优先级任务");
        dispatch_group_leave(group);
    });
    
    dispatch_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"dispatch group执行完成");
    });
    
    NSLog(@"任务执行完成");
}

- (void)dispatchSemaphore {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"任务一");
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"任务二");
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_async(queue, ^{
        NSLog(@"任务三");
        dispatch_semaphore_signal(semaphore);

    });
}

- (void)dispatchSemaphoreGroup {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t defaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, defaultQueue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        dispatch_async(defaultQueue, ^{
            sleep(2);
            NSLog(@"任务一");
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_async(group, defaultQueue, ^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        dispatch_async(defaultQueue, ^{
            sleep(2);
            NSLog(@"任务二");
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"dispatch group执行完成");
    });
    
    NSLog(@"任务执行完成");
}

- (void)dispatchSemaphoreArray {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [array addObject:[NSNumber numberWithInt:i]];
            NSLog(@"%@",array);
            dispatch_semaphore_signal(semaphore);
        });
    }
}


@end
