//
//  Students.h
//  Start
//
//  Created by 想当当 on 13-11-2.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Students : NSObject

@property (nonatomic, copy) NSString * realname;

- (Students *)studentRealName:(NSString *)firstname andLastName:(NSString *)lastname;

@end
