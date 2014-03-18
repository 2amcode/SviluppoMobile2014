//
//  AMViewController.m
//  Lezione3_b
//
//  Created by Andrea Maschio on 18/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    originalConstraintValue = self.topLayoutConstraint.constant;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)muoviLayout:(UIButton *)sender {
    [UIView animateWithDuration:0.7f animations:^{
        if(self.topLayoutConstraint.constant==originalConstraintValue){
            self.topLayoutConstraint.constant = 50;
        }else{
            self.topLayoutConstraint.constant = originalConstraintValue;
        }
        
        [self.view layoutIfNeeded];
    }];
    
}
@end
