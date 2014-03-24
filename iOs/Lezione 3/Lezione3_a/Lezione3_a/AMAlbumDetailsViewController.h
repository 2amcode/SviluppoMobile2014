//
//  AMAlbumDetailsViewController.h
//  Lezione3_a
//
//  Created by Andrea Maschio on 16/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import <UIKit/UIKit.h>
//forward classes
@class AMAlbumDetailsViewController;
@class Album;

@protocol AlbumDetailsEditingDelegate <NSObject>


//-(void)albumDetailsViewControllerDidSave:(AMAlbumDetailsViewController *)controller;
@required
-(void)albumDetailsViewController:(AMAlbumDetailsViewController *)controller didAddAlbum:(Album*)album;


@optional
-(void)albumDetailsViewControllerDidCancel:(AMAlbumDetailsViewController *)controller;

@end


@interface AMAlbumDetailsViewController : UITableViewController{

    __weak IBOutlet UITextField *txtBandName;
    __weak IBOutlet UITextField *txtAlbumTitle;
}

@property(nonatomic, weak) id <AlbumDetailsEditingDelegate>delegate;
@property(nonatomic, strong)Album * album;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
