//
//  PropertySubVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/6.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "PropertySubVC.h"

@interface PropertySubVC ()
@property (nonatomic, copy) NSString *firstName;

@end

@implementation PropertySubVC

@synthesize firstName = _firstName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
}

- (void)setFirstName:(NSString *)firstName {
    if (![firstName isEqualToString:@"ZHOU"]) {
        [NSException raise:NSInvalidArgumentException format:@"crash"];
    }
}

//- (NSString *)firstName {
//    return _firstName;
//}

@end
