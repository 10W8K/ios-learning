//
//  ListViewController.h
//  Start
//
//  Created by 想当当 on 13-11-1.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController
//@interface ListViewController : UIViewController

@property (strong, nonatomic)NSArray *dataList;

@property (strong, nonatomic)NSArray *list;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic)UITableViewCell *tableViewCell;

@end
