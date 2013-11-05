//
//  IndexViewController.m
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "IndexViewController.h"
#import "ListViewController.h"
#import "UIColor+Hex.h"
#import "Students.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

/**
 * ViewController的生命周期:
 * loadView -> viewDidLoad
 * ...
 */

- (void)loadView
{
    [super loadView];
    NSLog(@"loadView");
    //创建view
    UIView *contentView = [[UIView alloc]initWithFrame: [[UIScreen mainScreen] applicationFrame]];
    //contentView.backgroundColor = [UIColor lightGrayColor];
    contentView.backgroundColor = [UIColor colorWithHex:0xF3F3F3 alpha:1];
    self.view = contentView;
    

    //创建label控件并作为subview添加到view
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20.0, self.view.frame.size.height-50, self.view.frame.size.width, 25)];
    //UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 370.0, self.view.frame.size.width, 25)];
    label.text = @"Copyright 2004-2013 ALIPAY.COM. All Rights Reserved.";
    label.center = contentView.center;
    label.textColor = [UIColor colorWithHex:0xCCCCCC alpha:1];
    label.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    //label.backgroundColor = [UIColor lightGrayColor];
    //label.textAlignment = UITextAlignmentCenter;
    
    
    /**
     * You can set font size by these properties
     */
    /**
    [label setTextAlignment:NSTextAlignmentLeft];
    
    [label setBackgroundColor:[UIColor clearColor]];
    
    [label setAdjustsFontSizeToFitWidth:YES];
    
    [label setTextColor:[UIColor blackColor]];
    
    [label setUserInteractionEnabled:NO];
    
    [label setFont:[UIFont fontWithName:@"digital-7" size:60]];
    
    [label.layer.shadowColor =[[UIColor whiteColor ]CGColor ];
    
    [label.layer.shadowOffset=(CGSizeMake(0, 0));
    
    [label.layer.shadowOpacity=1;
    
    [label.layer.shadowRadius=3.0;
    
    [label.layer.masksToBounds=NO;
    
    [label.shadowColor=[UIColor darkGrayColor];
    
    [label.shadowOffset=CGSizeMake(0, 2);
    */
    
    [self.view addSubview:label];
    
    
    //创建button控件并作为subview添加到view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(50.0, 80.0, 77, 37)];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //Students *student = [Students studentRealName:@"Alex" andLastName:@"Yan"];
    Students *student = [[Students alloc]init];

    NSLog(@"%@",[student studentRealName:@"Alex" andLastName:@"Yan"].realname);
    
    self.navigationItem.title = @"首页";
}

- (void)buttonPressed:(id)sender
{
    /**
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ButtonPressed"
                                                   message:@"You have pressed the button"
                                                  delegate:nil
                                         cancelButtonTitle:@"cancel"
                                         otherButtonTitles:nil];
    [alert show];
     */
    
    ListViewController *listViewController = [[ListViewController alloc]init];
    [self.navigationController pushViewController:listViewController animated:true];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
    // Dispose of any resources that can be recreated.
}

@end
