//
//  JSONModel.m
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/12/24.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import "JSONModel.h"

@implementation JSONModel

- (NSString *)description {
    return [NSString stringWithFormat:@"name = %@\n, otherInfo=%@\n, familyMember=%@\n, age=%d\n, height=%f\n, money=%f\n, isHandsome=%@\n", _name, _otherInfo, _familyMember, _age, _height, _money, [NSNumber numberWithBool:_isHandsome]];
}


+ (NSDictionary *)propertyTransfer {
   return @{
      @"name":@"Name",
      @"age":@"currntAge"
      };
}

@end
