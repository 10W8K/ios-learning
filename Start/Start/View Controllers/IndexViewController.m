//
//  IndexViewController.m
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//
#import "AutoLayoutController.h"
#import "IndexViewController.h"
#import "ListViewController.h"
#import "WelComeViewController.h"
#import "UIColor+Hex.h"
#import "Students.h"


//#import "MMExampleCenterTableViewController.h"
//#import "MMExampleDrawerVisualStateManager.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "MMLogoView.h"
//#import "MMCenterTableViewCell.h"
//#import "MMExampleLeftSideDrawerViewController.h"
//#import "MMExampleRightSideDrawerViewController.h"
//#import "MMNavigationController.h"



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
}

- (void)buttonPressed:(id)sender
{
    ListViewController *listViewController = [[ListViewController alloc]init];
    [self.navigationController pushViewController:listViewController animated:true];
}

- (void)autoLayoutButtonPressed:(id)sender
{
    AutoLayoutController *autoLayoutController = [[AutoLayoutController alloc]init];
    [self.navigationController pushViewController:autoLayoutController animated:true];
}

- (void)alertViewShow:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ButtonPressed"
                                                   message:@"You have pressed the button"
                                                  delegate:nil
                                         cancelButtonTitle:@"cancel"
                                         otherButtonTitles:nil];
    [alert show];
}

- (void)goToWelComePage:(id)sender{
    WelComeViewController *welcomeController = [[WelComeViewController alloc]init];
    [self.navigationController pushViewController:welcomeController animated:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view.
    
    //创建view
    UIView *contentView = [[UIView alloc]initWithFrame: [[UIScreen mainScreen] applicationFrame]];
    contentView.backgroundColor = [UIColor colorWithHex:0xF3F3F3 alpha:1];
    self.view = contentView;
    

    //Students *student = [Students studentRealName:@"Alex" andLastName:@"Yan"];
    Students *student = [[Students alloc]init];
    NSLog(@"%@",[student studentRealName:@"Alex" andLastName:@"Yan"].realname);
    self.navigationItem.title = @"首页";

    
    //HTTP请求
    //1.同步GET
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url
                                                 cachePolicy:NSURLRequestUseProtocolCachePolicy
                                             timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil
                                                         error:nil];
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    
    //2.同步Post
    
    //create TextField
    [self createTextField];
    //create TabBar
    [self createTabBar];
    //create Label
    [self createLabel];
    //create Button
    [self createButton];
    
    [self setupLeftMenuButton];
    
    //隐藏后退按钮
    self.navigationItem.hidesBackButton = YES;
}

- (void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftBarButtonItem = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftBarButtonItem animated:YES];
    
}

//创建textField
- (void)createTextField
{
    self.textField = [[UITextField alloc]init];
    [self.textField viewWithTag:3];
    
    //[self.textField setFrame:CGRectMake(5.0, 180.0, self.view.frame.size.width-10, 37)];
    
    [self.textField setFrame:CGRectMake(5.0, self.view.bounds.size.height - 260, self.view.bounds.size.width - 10.0 , 44)];
    
    [self.textField setBorderStyle:UITextBorderStyleLine];//设置边框
    //self.textField.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    CALayer *textFieldLayer = [self.textField layer];
    CGColorSpaceRef textFieldColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef textFieldColorref = CGColorCreate(textFieldColorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [textFieldLayer setBorderColor:textFieldColorref];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];

}

//创建TabBar
- (void)createTabBar
{
    //TabBar
    self.tabBar = [[UITabBar alloc]init];
    [self.tabBar setFrame:CGRectMake(0, self.view.bounds.size.height -44, self.view.bounds.size.width, 44)];
    self.tabBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
    [self.tabBar setBackgroundColor:[UIColor colorWithHex:0xff6600]];
    [self.view addSubview:self.tabBar];
    
    UITabBarItem *tabBarItem0 = [[UITabBarItem alloc]initWithTitle:@"首页" image:nil tag:0];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"列表" image:nil tag:1];
    NSArray *tabBarItemArray = [[NSArray alloc] initWithObjects: tabBarItem0,tabBarItem1,nil];
    [self.tabBar setItems:tabBarItemArray];
}

- (void)createButton
{
    //创建button控件并作为subview添加到view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(5.0, 70.0, self.view.frame.size.width-10, 37)];
    [button setTitle:@"UITableView" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //
    CALayer *buttonLayer = [button layer];
    [buttonLayer setBorderWidth:1.0];//设置边框
    [buttonLayer setCornerRadius:4.0];//设置圆角半径
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [buttonLayer setBorderColor:colorref];
    [self.view addSubview:button];
    //
    UIButton *alertViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [alertViewButton setFrame:CGRectMake(5.0, 117.0, self.view.frame.size.width-10, 37)];
    [alertViewButton setTitle:@"AlertView" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [alertViewButton addTarget:self action:@selector(alertViewShow:) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer *alertViewButtonLayer = [alertViewButton layer];
    [alertViewButtonLayer setBorderWidth:1.0];//设置边框
    [alertViewButtonLayer setCornerRadius:4.0];//设置圆角半径
    CGColorSpaceRef alertViewColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef alertViewColorref = CGColorCreate(alertViewColorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [buttonLayer setBorderColor:alertViewColorref];
    [self.view addSubview:alertViewButton];
    
    
    UIButton *autoLayoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [autoLayoutButton setFrame:CGRectMake(5.0, 167.0, self.view.frame.size.width-10, 37)];
    [autoLayoutButton setTitle:@"AutoLayoutView" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [autoLayoutButton addTarget:self action:@selector(autoLayoutButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *autoLayoutButtonLayer = [autoLayoutButton layer];
    [autoLayoutButtonLayer setBorderWidth:1.0];//设置边框
    [autoLayoutButtonLayer setCornerRadius:4.0];//设置圆角半径
    CGColorSpaceRef autoLayoutColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef autoLayoutColorref = CGColorCreate(autoLayoutColorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [buttonLayer setBorderColor:autoLayoutColorref];
    [self.view addSubview:autoLayoutButton];
    
    
    
    UIButton *welcomeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [welcomeButton setFrame:CGRectMake(5.0, 217.0, self.view.frame.size.width-10, 37)];
    [welcomeButton setTitle:@"WelCome!" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [welcomeButton addTarget:self action:@selector(goToWelComePage:) forControlEvents:UIControlEventTouchUpInside];
    CALayer *welcomeButtonLayer = [welcomeButton layer];
    [welcomeButtonLayer setBorderWidth:1.0];//设置边框
    [welcomeButtonLayer setCornerRadius:4.0];//设置圆角半径
    CGColorSpaceRef welcomeColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef welcomeColorref = CGColorCreate(welcomeColorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [welcomeButtonLayer setBorderColor:welcomeColorref];
    [self.view addSubview:welcomeButton];
    

}

- (void)createLabel
{
    //创建label控件并作为subview添加到view
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(5.0, self.view.bounds.size.height - 50, self.view.frame.size.width - 10, 25)];
    label.text = @"Copyright 2004-2013 ALIPAY.COM. All Rights Reserved.";
    //label.center = contentView.center;//这句设置之后,label垂直居中对齐
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
}

// 触摸背景，关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView *view = (UIView *)[touch view];
    NSLog(@"touch");
    if(view == self.view){
        [self.textField resignFirstResponder];//第一种方法,再头文件中声明成全局控件
        //[[self.view.subviews objectAtIndex:3] resignFirstResponder];//第二种方法,找到subViews数组中对应的view索引
        /* 第三种方法 遍历subviews找到UITextField类型的view
         * http://stackoverflow.com/questions/10395690/clear-uitextfield-data-when-coming-to-that-page-again-iphone
         */
        /*
        NSArray *arraysubViews = [self.view subviews];
        for(UIView *subView in arraysubViews){
            if([subView isKindOfClass:[UITextField class]]){
                [subView resignFirstResponder];
            }
        }
         */
    }
}

- (BOOL)shouldAutorotate
{
    NSLog(@"shouldAutorotate");
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //这个方法是发生在翻转开始之前。一般用来禁用某些控件或者停止某些正在进行的活动，比如停止视频播放。
    NSLog(@"willRotateToInterfaceOrientation");
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //这个方法发生在翻转的过程中，一般用来定制翻转后各个控件的位置、大小等。可以用另外两个方法来代替
    //willAnimateFirstHalfOfRotationToInterfaceOrientation:duration:   和  willAnimateSecondHalfOfRotationFromInterfaceOrientation:duration:
    
    NSLog(@"willAnimateRotationToInterfaceOrientation");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

@end
