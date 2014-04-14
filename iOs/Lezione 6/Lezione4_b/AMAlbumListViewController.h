//
//  AMLinguaggiViewControllerTableViewController.h
//  Lezione4_b
//
//  Created by Andrea Maschio on 23/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMAlbumListViewController : UITableViewController

{
    NSMutableArray *albums;
}
- (IBAction)addAlbum:(UIBarButtonItem *)sender;
- (IBAction)refresh:(id)sender;

@end
