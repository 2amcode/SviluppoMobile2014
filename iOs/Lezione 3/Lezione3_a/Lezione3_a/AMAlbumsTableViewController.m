//
//  AMPlayersViewcontrollerTableViewController.m
//  Lezione3_a
//
//  Created by Andrea Maschio on 16/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMAlbumsTableViewController.h"
#import "Album.h"
#import "AMAlbumTableViewCell.h"

@interface AMAlbumsTableViewController ()

@end

@implementation AMAlbumsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    albums = [NSMutableArray new];
    
    Album *a = [[Album alloc]init];
    a.title = @"Facelift";
    a.band = @"Alice In Chains";
    a.rating = 4;
    
    Album *b = [[Album alloc]init];
    b.title = @"In Utero";
    b.band = @"Nirvana";
    b.rating = 5;
    
    Album *c = [[Album alloc]init];
    c.title = @"Superunknown";
    c.band = @"Soundgarden";
    c.rating = 4;
    
    Album *d = [[Album alloc]init];
    d.title = @"Bleach";
    d.band = @"Nirvana";
    d.rating = 3;
    
    [albums addObject:a];
    [albums addObject:b];
    [albums addObject:c];
    [albums addObject:d];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [albums count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AMAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"albumcell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Album *curAlbum = (Album*)[albums objectAtIndex:indexPath.row];
    cell.titleLabel.text = curAlbum.title;
    cell.bandLabel.text = curAlbum.band;
    cell.ratingImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"Star%d", curAlbum.rating]];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



 //Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [albums removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UINavigationController * navcontroller = segue.destinationViewController;
    AMAlbumDetailsViewController * detailsVC = navcontroller.viewControllers[0];
    
    if([segue.identifier isEqualToString:@"AddAlbum"]){
        
        detailsVC.delegate = self;
    }else if([segue.identifier isEqualToString:@"EditAlbum"]){
        
        AMAlbumTableViewCell * cell = (AMAlbumTableViewCell*)sender;
         NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Album *album = [albums objectAtIndex:indexPath.row];
        detailsVC.delegate = self;
        detailsVC.album = album;
    }
}

-(void)albumDetailsViewController:(AMAlbumDetailsViewController *)controller didAddAlbum:(Album*)album{
    if([albums containsObject:album]){
    [albums replaceObjectAtIndex:[albums indexOfObject:album] withObject:album];
    }else{
        [albums addObject:album];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
    
    //oppure
}
-(void)albumDetailsViewControllerDidCancel:(AMAlbumDetailsViewController *)controller{

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
