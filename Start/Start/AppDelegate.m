//
//  AppDelegate.m
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//
#import "UIColor+Hex.h"
#import "AppDelegate.h"
#import "IndexViewController.h"
#import "WelComeViewController.h"

#import "MMCenterTableViewController.h"
#import "MMLeftSideDrawerViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "MMDrawerVisualStateManager.h"
#import "MMLeftSideDrawerViewController.h"
#import "MMRightSideDrawerViewController.h"

#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"didFinishLaunchingWithOptions");
    
    self.leftSideDrawerViewController = [[MMLeftSideDrawerViewController alloc] init];
    
    self.rightSideDrawerViewController = [[MMRightSideDrawerViewController alloc] init];

    self.indexViewController = [[IndexViewController alloc] init];
    
    self.welcomeViewController = [[WelComeViewController alloc] init];
    
    self.centerViewController = [[MMCenterTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    self.navigatorController = [[UINavigationController alloc]initWithRootViewController:self.indexViewController];
    
    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:self.navigatorController
                             leftDrawerViewController:self.leftSideDrawerViewController
                             rightDrawerViewController:self.rightSideDrawerViewController
                             ];
    
    [self.drawerController setMaximumLeftDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [[MMDrawerVisualStateManager sharedManager] drawerVisualStateBlockForDrawerSide:drawerSide];
        if(block){
            block(drawerController, drawerSide, percentVisible);
        }
    }];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:self.drawerController];


    /**
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0){
        NSLog(@">=4.0");
        self.window.rootViewController = self.navigatorController;
        //self.window.rootViewController = self.welcomeView;
    }else{
        NSLog(@"<4.0");
        [self.window addSubview:self.navigatorController.view];
        //[self.window addSubview:self.welcomeView.view];
    }
    **/
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}


@end
