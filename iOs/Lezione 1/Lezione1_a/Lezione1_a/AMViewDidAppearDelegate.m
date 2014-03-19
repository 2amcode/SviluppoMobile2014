//
//  AMViewLoadingDelegate.m
//  Lezione1_a
//
//  Created by Andrea Maschio on 02/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMViewDidAppearDelegate.h"


@implementation AMViewDidAppearDelegate
-(void)viewHasBeenLoaded:(UIView *)aView{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    aView.backgroundColor = color;
}


@end
