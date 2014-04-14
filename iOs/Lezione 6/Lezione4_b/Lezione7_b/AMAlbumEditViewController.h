//
//  AMLinguaggioEditViewController.h
//  Lezione4_b
//
//  Created by Andrea Maschio on 23/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"


@interface AMAlbumEditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtAlbum;
@property (weak, nonatomic) IBOutlet UITextField *txtBand;
@property (weak, nonatomic) IBOutlet UISlider *ratingSlider;
@property (weak, nonatomic) IBOutlet UILabel *txtRating;
- (IBAction)saveAlbum:(id)sender;

@property (nonatomic, strong) Album *album;
@end
