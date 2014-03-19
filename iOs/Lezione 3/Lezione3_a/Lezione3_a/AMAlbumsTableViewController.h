//
//  AMPlayersViewcontrollerTableViewController.h
//  Lezione3_a
//
//  Created by Andrea Maschio on 16/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMAlbumDetailsViewController.h"
@interface AMAlbumsTableViewController : UITableViewController<AlbumDetailsEditingDelegate>
{
    NSMutableArray * albums;
}

@end
