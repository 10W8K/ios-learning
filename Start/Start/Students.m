//
//  Students.m
//  Start
//
//  Created by 想当当 on 13-11-2.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "Students.h"

@implementation Students

- (Students *)studentRealName:(NSString *)firstname andLastName:(NSString *)lastname
{
    Students *student = [[Students alloc]init];
    student.realname = [NSString stringWithFormat:@"%@ %@",firstname,lastname];
    return  student;
}

@end
