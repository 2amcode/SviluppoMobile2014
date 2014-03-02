//
//  AMViewLoadingDelegate.h
//  Lezione1_a
//
//  Created by Andrea Maschio on 02/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewDidAppearDelegate
@required
-(void)viewHasBeenLoaded:(UIView*)aView;
@optional
-(void)someOtherMethod;
@end

@interface AMViewDidAppearDelegate : NSObject <ViewDidAppearDelegate>

@end
