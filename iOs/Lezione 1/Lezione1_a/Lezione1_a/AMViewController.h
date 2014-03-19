
//  AMViewController.h -> nome file
//  Lezione1_a -> nome progetto
//	 info di copyright->
//  Created by Andrea Maschio on 02/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMViewDidAppearDelegate.h"

@interface AMViewController : UIViewController{
    
    NSString * myStringIvar;
    NSNumber * myNumberIvar;
    //...
}

@property(nonatomic, strong)NSString * value;
@property(nonatomic, strong)id delegate;

@end