//
//  TestMonitorVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/7/17.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "TestMonitorVC.h"

@interface TestMonitorVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    CADisplayLink *_link;
    NSUInteger _count;
    NSTimeInterval  _lastTime;
}

@end

@implementation TestMonitorVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    __weak typeof(self)weakSelf = self;
    _link = [CADisplayLink displayLinkWithTarget:weakSelf selector:@selector(linkCallback:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)dealloc {
    [_link invalidate];
}

#pragma mark - Action
- (void)linkCallback:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    _count++;
    NSTimeInterval timeInterval = link.timestamp - _lastTime;
    if (timeInterval < 1) return;
    
    float fps = _count / timeInterval;
    
    NSLog(@"fps = %.2f", fps);

    _count = 0;
    _lastTime = link.timestamp;
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    for (int i = 0; i < 7; i++) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 65*i, 0, 60, 70)];
        imageV.image = [UIImage imageNamed:@"test.jpeg"];
        imageV.layer.cornerRadius = 4;
        imageV.layer.masksToBounds = YES;
        [cell addSubview:imageV];
    }
    
    return cell;
}


@end
