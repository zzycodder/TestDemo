//
//  JSONModel.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/24.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JSONModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDictionary *otherInfo;
@property (nonatomic, copy) NSArray *familyMember;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) float money;
@property (nonatomic, assign) BOOL isHandsome;

@end
