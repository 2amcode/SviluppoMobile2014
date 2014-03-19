//
//  AMViewController.h
//  Lezione3_b
//
//  Created by Andrea Maschio on 18/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMViewController : UIViewController{
    int originalConstraintValue;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutConstraint;
- (IBAction)muoviLayout:(UIButton *)sender;

@end
