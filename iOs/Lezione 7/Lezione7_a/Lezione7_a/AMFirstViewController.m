//
//  AMFirstViewController.m
//  Lezione7_a
//
//  Created by Andrea Maschio on 01/04/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMFirstViewController.h"

@interface AMFirstViewController ()

@end

@implementation AMFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"Welcome", @"App start salutation title") message:NSLocalizedString(@"This text is localized in english", @"Explanation for the app start salutation message") delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
