//
//  AMDetailViewController.h
//  Lezione3_c
//
//  Created by Andrea Maschio on 20/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

- (IBAction)openPopover:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property(nonatomic, strong)UIPopoverController * controller;
@end
