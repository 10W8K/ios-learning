//
//  AutoLayoutController.m
//  Start
//
//  Created by 想当当 on 13-11-8.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "AutoLayoutController.h"

@interface AutoLayoutController ()

@end

@implementation AutoLayoutController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIView *view1 = [[UIView alloc]init];
    //[alertViewButton setFrame:CGRectMake(5.0, 117.0, self.view.frame.size.width-10, 37)];
    [view1 setFrame:CGRectMake(20.0, 80.0, 130.0, 210)];
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];

    
    //[view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *view2 = [[UIView alloc]init];
    [view2 setFrame:CGRectMake(170.0, 80.0, 130.0, 210)];
    view2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view2];
    //[view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *view3 = [[UIView alloc]init];
    [view3 setFrame:CGRectMake(20.0, 310.0, 280.0, 210)];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view3];
    //[view3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    
    



    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view2
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:0
                                                           constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view2
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view2
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view3
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view1
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:20]];

    


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
