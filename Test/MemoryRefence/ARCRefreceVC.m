
//
//  ARCRefreceVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/25.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "ARCRefreceVC.h"
#import <objc/runtime.h>
#import "ArcRefennceObj.h"

@interface ARCRefreceVC ()
@property (nonatomic, weak) NSObject *obj1;
@property (nonatomic, strong) NSObject *obj2;
@property (nonatomic, strong) ArcRefennceObj *arcRefrenceObj;

@end

@implementation ARCRefreceVC

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
    self.obj1 = [NSObject new];
    self.obj2 = [NSObject new];

    NSMutableArray * array1;
    @autoreleasepool {
        array1 = [[NSMutableArray alloc] initWithObjects:@1, nil];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:@1, nil];
        [array2 addObject:@2];
    }
    
    
    [array1 addObject:@2];
    NSLog(@"array1 = %@", array1);
    
    NSLog(@"%@", _obj1.description);
    NSLog(@"%@", _obj2.description);
     **/
    
    NSDictionary *dic = @{@"name":@"zzy"};
    [self changVariable:&dic];
    NSLog(@"dic = %@", dic);
    
    Class class = object_getClass(self);
    const char *clsName = class_getName(class);
    
    Class cls = objc_lookUpClass(clsName);
    NSLog(@"cls = %@", cls);
}


- (void)changVariable:(NSDictionary **)dic {
    *dic = @{@"key":@"value"};
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

@end
