//
//  MemoryRefenceVC.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/25.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "MemoryRefenceVC.h"
#import <objc/runtime.h>
#import "MemoryObject.h"

@interface MemoryRefenceVC ()

@property (nonatomic, copy) NSArray *array1;
@property (nonatomic, copy) NSArray *array2;
@property (nonatomic, strong) NSObject *object1;
@property (nonatomic, strong) NSObject *object2;
@property (nonatomic, strong) MemoryObject *memoryObject1;

@end

@implementation MemoryRefenceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.array1 = [NSArray arrayWithObject:@1];
    
    self.array2 = [[[NSArray alloc] initWithObjects:@2, @"adf", nil] autorelease];

    NSLog(@"array1.retainCount = %ld", _array1.retainCount);
    NSLog(@"array2.retainCount = %ld", _array2.retainCount);
    
    [self.array2 release];
    [self.array2 release];
    [self.array2 indexOfObject:@2];
    
//    self.object1 = [[NSObject alloc] init];
//
//    self.memoryObject1 = [MemoryObject new];
//
//
//    MemoryObject *memoryObject2 = [MemoryObject new];
//
//    NSLog(@"memoryObject1.retainCount = %ld", _memoryObject1.retainCount);
//    NSLog(@"memoryObject2.retainCount = %ld", memoryObject2.retainCount);


    
//    [self.array release];
    
//    [_object1 release];
    
//    [self performSelector:@selector(objectRerenceCount) withObject:nil afterDelay:2];
    

//    NSLog(@"object1.retainCount = %ld", _object1.retainCount);


//    NSObject *object = [[NSObject alloc] init];
//    NSLog(@"object.retainCount = %ld", object.retainCount);
    
//    [memoryObject2 release];
//    [_memoryObject1 release];
    
    
    id obj = [NSArray array];
    [obj release];
    
}

- (void)setArray1:(NSArray *)array1 {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"array1.retainCount = %ld", _array1.retainCount);
    NSLog(@"array2.retainCount = %ld", _array2.retainCount);
//    NSLog(@"object1.retainCount = %ld", _object1.retainCount);

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"array1.retainCount = %ld", _array1.retainCount);
//    NSLog(@"array2.retainCount = %ld", _array2.retainCount);
//    NSLog(@"object1.retainCount = %ld", _object1.retainCount);
}


- (void)objectRerenceCount {
//    NSLog(@"array1.retainCount = %ld", _array1.retainCount);
//    NSLog(@"array2.retainCount = %ld", _array2.retainCount);
//    NSLog(@"object1.retainCount = %ld", _object1.retainCount);
}

- (void)createNSZombie {
    //获取当前对象的类名
    const char *className = object_getClassName(self);
    //创建新的僵尸对象类名
    const char *zombieClassName = strcat("_NSZombie_", className);
    //根据僵尸对象类名获取僵尸对象类(`objc_lookUpClass` 相比 `objc_getClass`，当类没有注册时不会去调用类处理回调)
    Class zombieClass = objc_lookUpClass(zombieClassName);
    
    //如果不存在，先创建僵尸对象类
    if (!zombieClass) {
        //获取_NSZombie_类
        Class baseZombieClass = objc_lookUpClass("_NSZombie_");
        //这里使用的是`objc_duplicateClass`创建新的类，`objc_duplicateClass`是直接拷贝目标类生成新的类然后赋予新的类名，新的类和_NSZombie_类结构相同，本类的父类，实例变量和方法都和复制前一样。
        zombieClass = objc_duplicateClass(baseZombieClass, zombieClassName, 0);
    }
    
    //销毁对象，但是不释放对象占用的内存
    objc_destructInstance(self);
    
    //重新设置当前对象所属的类，让其指向新创建的僵尸类
    object_setClass(self, zombieClass);
}

- (void)dealloc
{
    [super dealloc];
    NSLog(@"_memoryObject1.retainCount = %ld", _memoryObject1.retainCount);
    [_memoryObject1 release];
    NSLog(@"_memoryObject1.retainCount = %ld", _memoryObject1.retainCount);

    [_memoryObject1 release];
    _memoryObject1 = nil;

    NSLog(@"_memoryObject1.retainCount = %ld", _memoryObject1.retainCount);
    
}


@end
