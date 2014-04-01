//
//  AMViewController.h
//  Lezione5_a
//
//  Created by Andrea Maschio on 24/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMViewController : UIViewController<NSURLConnectionDelegate>{
    NSMutableData * receivedData;
    NSMutableArray *albums;
}

@end
