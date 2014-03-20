//
//  AMMasterViewController.h
//  Lezione3_c
//
//  Created by Andrea Maschio on 20/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMDetailViewController;

@interface AMMasterViewController : UITableViewController

@property (strong, nonatomic) AMDetailViewController *detailViewController;

@end
