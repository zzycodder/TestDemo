//
//  PropertyVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/6.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "PropertyVC.h"
#import <objc/runtime.h>

@interface PropertyVC ()
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, copy) NSString *name;

@end


@implementation PropertyVC
//@dynamic firstName;
//@synthesize firstName = _firstName;


+ (void)load {
//    NSLog(@"PropertyVC load size = %zd", class_getInstanceSize(self));
}

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                        dataArray:(NSArray *)dataArray {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        _lastName = lastName;
        _dataArray = dataArray;
        NSLog(@"初始化_firstName = %@", _firstName);
        NSLog(@"初始化_dataArray = %@", _dataArray);
    }
    return self;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"viewDidAppear-----_firstName = %@", _firstName);
    NSLog(@"viewDidAppear-----_dataArray = %@", _dataArray);
}

//- (void)setFirstName:(NSString *)firstName {
//    _firstName = firstName;
//    [self doSomething:@"something"];
//}
//
//- (NSString *)firstName {
//    return _firstName;
//}

- (void)doSomething:(NSString *)something {
    
}

@end
