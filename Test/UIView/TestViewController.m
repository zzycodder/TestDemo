//
//  TestViewController.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/13.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "TestViewController.h"
#import "CustomView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self shadowLayer];
    [self addFocusCustomView];
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

- (void)addFocusCustomView {
    CustomView *view1 = [[CustomView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    CustomView *view2 = [[CustomView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
    CustomView *view3 = [[CustomView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    view3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view3];
    
    [view1 setCenter:CGPointMake(50, 100)];
}

@end
