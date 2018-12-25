//
//  JSONModelVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/24.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "JSONModelVC.h"

@interface JSONModelVC ()

@end

@implementation JSONModelVC

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *dic = @{
                             @"Name":@"LOLITA0164",
                             @"sex":@(1),
                             @"currntAge":@(24),
                             @"height":@"170.0",
                             //                             @"money":@"0.112",   // 可以没有对应字段
                             @"otherInfo":@{@"profession":@"iOS mobile development"},
                             @"isHandsome":@(YES),
                             @"familyMember":@[@"father",@"mother",@"brother",@"older sister"],
                             @"additional":@"我是测试条件"    // 可以多余字段
                             };
    
}


@end
