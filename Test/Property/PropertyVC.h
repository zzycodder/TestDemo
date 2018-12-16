//
//  PropertyVC.h
//  Test
//
//  Created by ZHANGZHONGYANG on 2018/11/6.
//  Copyright © 2018年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyVC : UIViewController
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                        dataArray:(NSArray *)dataArray;

@end
