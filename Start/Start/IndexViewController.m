//
//  IndexViewController.m
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "IndexViewController.h"
#import "ListViewController.h"

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
    self.view = contentView;
    //创建label控件并作为subview添加到view
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 30.0, 320, 30)];
    label.text = @"PureCode";
    label.center = contentView.center;
    //label.backgroundColor = [UIColor lightGrayColor];
    //label.textAlignment = UITextAlignmentCenter;
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
