//
//  ThreadVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/20.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ThreadVC.h"
#import "NSThreadVC.h"
#import "NSOpreationQueueVC.h"
#import "GCDVC.h"

@interface ThreadVC ()

@end

@implementation ThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *threadButton = [self buttonWithFrame:CGRectMake(150, 150, 100, 100) title:@"NSThread" target:self action:@selector(pushToThreadVC)];
    [self.view addSubview:threadButton];

    UIButton *opreationButton = [self buttonWithFrame:CGRectMake(150, 300, 100, 100) title:@"NSOperation" target:self action:@selector(pushToNSOperationQueueVC)];
    [self.view addSubview:opreationButton];

    UIButton *gcdButton = [self buttonWithFrame:CGRectMake(150, 450, 100, 100) title:@"GCD" target:self action:@selector(pushToGCDVC)];
    [self.view addSubview:gcdButton];
}

#pragma mark - Action

- (void)pushToThreadVC {
    NSThreadVC *vc = [[NSThreadVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushToNSOperationQueueVC {
    NSOpreationQueueVC *vc = [[NSOpreationQueueVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushToGCDVC {
    GCDVC *vc = [[GCDVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Button

- (UIButton *)buttonWithFrame:(CGRect)frame
                      title:(NSString *)title
                     target:(id)target
                     action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    [button setCenter:CGPointMake(self.view.center.x, button.center.y)];

    return button;
}

@end
