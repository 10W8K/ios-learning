//
//  WelComeViewController.h
//  Start
//
//  Created by 想当当 on 13-11-18.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EAIntroView/EAIntroView.h>

@interface WelComeViewController : UIViewController <UIScrollViewDelegate, EAIntroDelegate>

@property (strong, nonatomic)UIScrollView *scrollView;

@end
