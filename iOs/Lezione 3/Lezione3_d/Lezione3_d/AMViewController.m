//
//  AMViewController.m
//  Lezione3_d
//
//  Created by Andrea Maschio on 22/03/14.
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
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
            _arancioneLeadingSuperView.constant = _verdeLeadingSuperView.constant+20;
            _verdeLeadingSuperView.constant = 20;
            _arancioneTopSuperView.constant = 7;
            _verdeBottomSuperView.constant  = 20;
            
        }else{
            _verdeLeadingSuperView.constant = 416;
            _verdeBottomSuperView.constant  = 639;
            _arancioneTopSuperView.constant = 534;
            _arancioneLeadingSuperView.constant =20;
        }
        [self.view layoutIfNeeded];
    }];
    
}
@end
