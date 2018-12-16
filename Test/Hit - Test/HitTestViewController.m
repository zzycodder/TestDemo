//
//  HitTestViewController.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/7/30.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "HitTestViewController.h"
#import "HitTestButton.h"
#import "HitTestSuperView.h"
#import "ViewController.h"

@interface HitTestViewController ()

@property (nonatomic, strong) HitTestButton *hitTestButton;
@property (nonatomic, strong) HitTestSuperView *hitTestView;

@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    HitTestSuperView *view = [[HitTestSuperView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    view.backgroundColor = [UIColor blueColor];
    self.hitTestView = view;
    [self.view addSubview:view];
    
    
    HitTestButton *button = [HitTestButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(-50, -50, 100, 100);
//    button.clickWidth = 300;
//    button.clickHeight = 300;
    button.backgroundColor = [UIColor orangeColor];
    [view addSubview:button];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchDown];
    
    self.hitTestButton = button;
}

- (void)clickAction {
    NSLog(@"触发了button");
    
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
