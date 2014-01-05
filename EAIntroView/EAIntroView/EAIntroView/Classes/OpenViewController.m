//
//  OpenViewController.m
//  EAIntroView
//
//  Created by 想当当 on 14-1-5.
//  Copyright (c) 2014年 想当当. All rights reserved.
//

//IOS7开发～Xcode5制作framework
//http://blog.csdn.net/lizhongfu2013/article/details/12648633

#import "OpenViewController.h"
#import "PrivateViewController.h"

@implementation OpenViewController

- (void)testFunction
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"EAIntroView"
                                                   message:@"You have pressed the button"
                                                  delegate:nil
                                         cancelButtonTitle:@"cancel"
                                         otherButtonTitles:nil];
    [alert show];
}

@end
