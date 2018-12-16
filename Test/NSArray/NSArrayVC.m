//
//  NSArrayVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/23.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "NSArrayVC.h"

@interface NSArrayVC ()

@end

@implementation NSArrayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [NSArray arrayWithObjects:@"adsf", nil];
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@"dfdf", nil];
    NSLog(@"===============================");

    NSLog(@"mArray.class = %@", mArray.class);
    
    if ([mArray class] == [NSMutableArray class]) {
        NSLog(@"判断相等====true");
    }
    
    if ([mArray isMemberOfClass:[NSMutableArray class]]) {
        NSLog(@"isMemberOfClass NSArray== true");
    }
    
    if ([mArray isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"isKindOfClass NSMutableArray== true");
    }
    if ([mArray isKindOfClass:[NSArray class]]) {
        NSLog(@"isKindOfClass mArray == true");
    }
    
    NSArray *array1 = @[@1, @2, @3];
    NSArray *array2 = @[@1, @2, @3];
    NSArray *array3 = array1;

    if ([array1 isEqualToArray:array2]) {
        NSLog(@"array1 isEqualTo array2 !");
    }
    
    if (array1 == array2) {
        NSLog(@"array1 == array2 !");
    }else {
        NSLog(@"array1 != array2 !");
    }
    
    if (array3 == array1) {
        NSLog(@"array3 == array1 !");
    }else {
        NSLog(@"array3 != array1 !");
    }
    
    array3 = array2;
    
    if (array3 == array1) {
        NSLog(@"变换后 array3 == array1 !");
    }else {
        NSLog(@"变换后 array3 != array1 !");
    }
    
    if (array3 == array2) {
        NSLog(@"array3 == array2 !");
    }else {
        NSLog(@"array3 != array2 !");
    }
}



@end
