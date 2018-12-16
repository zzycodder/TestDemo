//
//  ViewController.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/5/20.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ViewController.h"

#import <JavaScriptCore/JavaScriptCore.h>

#import "AObj.h"
#import "BObj.h"
#import "PropertyVC.h"
#import "PropertySubVC.h"
#import "ClickButton.h"
#import "MemoryRefenceVC.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic, strong) id obj_Reatein;
@property (nonatomic, strong) UIButton *clickButton;
@property (nonatomic, assign) NSInteger count;
@end

void (^block) (void) = ^{
    NSLog(@"adf");
};

int global;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    int local;
    
    NSLog(@"global = %d", global);
    NSLog(@"local = %d", local);

    
    NSURL *URL = [NSURL URLWithString:@"http://method/page/route?key=value"];
    
    [NSString stringWithContentsOfURL:nil encoding:nil error:nil];
    
    NSLog(@"scheme = %@", URL.scheme);
    
    NSLog(@"host = %@", URL.host);

    NSLog(@"pathComponents = %@", URL.pathComponents);

    NSLog(@"query = %@", URL.query);
    
    __strong NSString *str = @"123";
    __weak NSString *str1 = str;
    str = nil;
    NSLog(@"str1 = %@", str1);
    
    
    NSObject *obj = [NSObject new];
    __weak NSObject *obj1 = obj;
    
    NSObject *obj2 = obj;
    
    NSLog(@"%d", obj == obj2);
    
    obj = nil;
    NSLog(@"obj1 = %@", obj1);
    
//    AObj *aObj = [AObj new];
//    NSLog(@"AObj.size = %zd", class_getInstanceSize(aObj.class));
    
//    aObj.name = @"zzy";
//    NSLog(@"/////AObj.size = %zd", class_getInstanceSize(aObj.class));

    
    ClickButton *button = [ClickButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(150, 150, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    self.clickButton = button;
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchDown];
    
    
//    __weak typeof(self) weakSelf= self;
//    self.clickButton = [[ClickButton alloc] initClickButtonWithFrame:CGRectMake(150, 150, 100, 100) superView:self.view callback:^{
//        [weakSelf.clickButton removeFromSuperview];
//        _clickButton = nil;
//    }];
}

- (void)clickAction {
    self.count++;
    NSLog(@"count = %ld", _count);
//    [_clickButton removeFromSuperview];
//    _clickButton = nil;
    
    MemoryRefenceVC *vc = [MemoryRefenceVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
