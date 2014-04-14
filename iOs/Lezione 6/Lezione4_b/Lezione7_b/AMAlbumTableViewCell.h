//
//  AMAlbumTableViewCell.h
//  Lezione3_a
//
//  Created by Andrea Maschio on 16/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMAlbumTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bandLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImg;

@end
