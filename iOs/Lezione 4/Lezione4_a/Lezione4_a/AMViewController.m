//
//  AMViewController.m
//  Lezione4_a
//
//  Created by Andrea Maschio on 23/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)inviaTesto:(UIButton *)sender {
    NSURL * url = [NSURL  URLWithString:[NSString stringWithFormat:@"receiver://%@", _txtToSend.text]];
    UIApplication * app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:url]){
        [app openURL:url];
    }
}

@end
