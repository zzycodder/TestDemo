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
    
    /**
     两种情况：
     1. 超出button的点击区域依然可以响应点击事件：重写button的`- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event`方法，将落在button frame外面的point 也返回YES
     
     2. 当前的子View超出了父View的bounds范围，依然能够响应事件：重写父View的`- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event` 方法，去掉`hitTest`内部的`pointInside`方法关于点击是否在父View内的判断。因为如果不在父View内，就不会再去子视图中寻找HitTestView了
     
     */
    
    
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
