//
//  WelComeViewController.m
//  Start
//
//  Created by 想当当 on 13-11-18.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "WelComeViewController.h"
#import "UIColor+Hex.h"

@interface WelComeViewController ()

@end

@implementation WelComeViewController

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
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 340, 760)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = true;
    self.scrollView.tag = INT_MAX;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.contentSize = CGSizeMake(340 * 4, 480);
    [self.view addSubview:self.scrollView];
    
    int _x = 0;
    for (int index = 0; index < 4; index++){
        UIImageView *imgScrollView = [[UIImageView alloc] initWithFrame:CGRectMake(0+_x, 0, 320, 510)];
        imgScrollView.tag = index;
        NSString *imgName = [NSString stringWithFormat:@"%d.png", index + 1];
        imgScrollView.image = [UIImage imageNamed:imgName];
        [_scrollView addSubview:imgScrollView];
        _x += 340;
    }
    
    
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 460, 320, 50)];
    pageControl.numberOfPages = 4;
    pageControl.tag = 101;
    [self.view addSubview:pageControl];
    
    //UIImage *img = [UIImage imageNamed:@"Default.png"];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:img]];
    
    /***
    [pageControl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[pageControl]-100-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(pageControl)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[pageControl]-100-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(pageControl)]];
     **/
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x / 320 ;
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:101];
    pageControl.currentPage = current;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
