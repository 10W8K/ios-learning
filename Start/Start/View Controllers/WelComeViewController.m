//
//  WelComeViewController.m
//  Start
//
//  Created by 想当当 on 13-11-18.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "WelComeViewController.h"
#import "IndexViewController.h"
#import "NavController.h"
#import "UIColor+Hex.h"
#import <EAIntroView/SMPageControl.h>
#import <EAIntroView/EAIntroPage.h>
#import <EAIntroView/EAIntroView.h>

static NSString * const sampleDesc1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDesc2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDesc3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDesc4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

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
    
    /**
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
        UIImageView *imgScrollView = [[UIImageView alloc] initWithFrame:CGRectMake(0+_x, 0, 320, 570)];
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
     
    */
    
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
    


    //[self.navigationController setNavigationBarHidden:true];
    
    
    //使用EAIntroView
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDesc1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleImage = [UIImage imageNamed:@"title1"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDesc2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleImage = [UIImage imageNamed:@"title2"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDesc3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleImage = [UIImage imageNamed:@"title3"];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDesc3;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleImage = [UIImage imageNamed:@"title4"];
    

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [intro showInView:self.view animateDuration:0.3];

    
    
    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.pageIndicatorImage = [UIImage imageNamed:@"pageDot"];
    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"selectedPageDot"];
    [pageControl sizeToFit];
    [self.view addSubview:pageControl];
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int current = scrollView.contentOffset.x / 320 ;
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:101];
    pageControl.currentPage = current;
    if (current == 3) {
        //NavController * nav = [[NavController alloc] init];

        IndexViewController * index = [[IndexViewController alloc]init];
        [self.navigationController pushViewController:index animated:true];
        [self.navigationController setNavigationBarHidden:false];
        //[self.navigationController.navigationItem hidesBackButton];
        
        /**
        [self presentViewController:nav animated:true completion:^{
            NSLog(@"jumped....");
        }];
         */
    }
}

- (void)introDidFinish:(EAIntroView *)introView{
    NSLog(@"introDidFinish callback");
    IndexViewController *indexViewController = [[IndexViewController alloc]init];
    [self.navigationController pushViewController:indexViewController animated:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 隐藏status bar
 * http://stackoverflow.com/questions/17763719/status-bar-wont-disappear
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
