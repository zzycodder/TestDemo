//
//  RunLoopMonitor.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/7/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "RunLoopMonitor.h"

@interface RunLoopMonitor ()
{
    CFRunLoopObserverRef _observer;
    dispatch_semaphore_t _semphore;
    CFRunLoopActivity _activity;
    NSUInteger _timeOutCount;
}
@end;

@implementation RunLoopMonitor

+ (instancetype)shareInstance {
    static RunLoopMonitor *monitor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        monitor = [[self alloc] init];
    });
    return monitor;
}

- (void)startMonitor {
    if (_observer) return;
    
    _semphore = dispatch_semaphore_create(0);
    
    CFRunLoopObserverContext context = {0, (__bridge void*)self, NULL, NULL};
    _observer = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                        kCFRunLoopAllActivities,
                                        YES,
                                        0,
                                        &runLoopObserverCallBack,
                                        &context);
    CFRunLoopAddObserver(CFRunLoopGetMain(), _observer, kCFRunLoopCommonModes);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (YES) {
            long st = dispatch_semaphore_wait(_semphore, 50*NSEC_PER_MSEC);
            if (st != 0) {
                if (!_observer) {
                    _semphore = 0;
                    _timeOutCount = 0;
                    _activity = 0;
                    return;
                }
                if (_activity == kCFRunLoopBeforeSources || _activity == kCFRunLoopAfterWaiting) {
                    _timeOutCount++;
                    if (_timeOutCount < 5) {
                        continue;
                    }
                    NSLog(@"有些卡顿....");
                }
            }
            _timeOutCount = 0;
        }
    });
    
}

static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    RunLoopMonitor *monitor = (__bridge RunLoopMonitor *)info;
    monitor->_activity = activity;
    
    dispatch_semaphore_t semphore = monitor->_semphore;
    dispatch_semaphore_signal(semphore);
}

- (void)endMonitor {
    if (_observer) return;
    
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), _observer, kCFRunLoopCommonModes);
    CFRelease(_observer);
    _observer = NULL;
}

@end
