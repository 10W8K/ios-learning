//
//  AppDelegate.h
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IndexViewController;

#import "IndexViewController.h"
#import "WelComeViewController.h"
#import "MMDrawerController.h"
#import "MMLeftSideDrawerViewController.h"
#import "MMRightSideDrawerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigatorController;

@property (strong, nonatomic) MMLeftSideDrawerViewController * leftSideDrawerViewController;

@property (strong, nonatomic) MMRightSideDrawerViewController * rightSideDrawerViewController;

@property (strong, nonatomic) IndexViewController *indexViewController;

@property (strong, nonatomic) WelComeViewController *welcomeViewController;

@property (strong, nonatomic) MMDrawerController * drawerController;

@property (strong, nonatomic) UIViewController * centerViewController;

@end
