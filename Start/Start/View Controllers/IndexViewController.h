//
//  IndexViewController.h
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "Students.h"
#import <UIKit/UIKit.h>
/**
 * 注意尖括号里的值
 * 表示这个类遵循UITextFieldDelegate这个协议
 */
@interface IndexViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic)Students *student;

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) UITabBar *tabBar;

- (BOOL)textFieldShouldReturn:(id)sender;

@end
