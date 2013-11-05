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

-  (NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature* signature = [super methodSignatureForSelector:selector];
    if (!signature){
        NSLog(@"Signature");
        //signature = [self.carInfo methodSignatureForSelector:selector];
    }
    return signature;
}

@end
