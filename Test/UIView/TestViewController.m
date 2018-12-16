//
//  TestViewController.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/13.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self shadowLayer];
}

- (void)shadowLayer {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.cornerRadius = 3;
    view.layer.shadowOpacity = 0.16f;
    view.layer.shadowOffset = CGSizeMake(0, 2);

//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100, 200)];
//    [path addLineToPoint:CGPointMake(200, 200)];
//    [path closePath];
//
//    view.layer.shadowPath = path.CGPath;
}

@end
