//
//  KVCViewController.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/25.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "KVCViewController.h"
#import "KVCObject.h"

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KVCObject *obj = [[KVCObject alloc] init];
    [obj setValue:nil forKey:@"name"];
//    [obj setValue:nil forKey:@"number"];
    BOOL isMan = [obj valueForKey:@"isMan"];
    NSNumber *age = [obj valueForKey:@"age"];
    NSLog(@"%@", [NSNumber numberWithBool:isMan]);
    NSLog(@"%@", age);
    
}

@end
