//
//  AMLinguaggiViewControllerTableViewController.m
//  Lezione4_b
//
//  Created by Andrea Maschio on 23/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMAlbumListViewController.h"
#import "Album.h"
#import "AMAlbumTableViewCell.h"
#import "AMAlbumEditViewController.h"

@interface AMAlbumListViewController ()

@end

@implementation AMAlbumListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self refresh:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    

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
    return albums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AMAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"albumCell" forIndexPath:indexPath];
    
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



- (void)saveDataToFile
{
    NSError  *error;
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSData * archiveData = [NSKeyedArchiver archivedDataWithRootObject:albums];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [archiveData writeToFile:[documentsDirectory stringByAppendingPathComponent:@"albums.plist"] options:NSDataWritingAtomic error:&error];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [albums removeObject:[albums objectAtIndex:indexPath.row]];
        [self saveDataToFile];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self refresh:nil];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AMAlbumEditViewController * editVC  =[[AMAlbumEditViewController alloc] initWithNibName:@"AMAlbumEditViewController" bundle:[NSBundle mainBundle]];
    editVC.album = [albums objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:editVC animated:YES];
}
- (IBAction)addAlbum:(UIBarButtonItem *)sender {
    AMAlbumEditViewController * editVC  =[[AMAlbumEditViewController alloc] initWithNibName:@"AMAlbumEditViewController" bundle:[NSBundle mainBundle]];
    
    [self.navigationController pushViewController:editVC animated:YES];
}

- (IBAction)refresh:(id)sender {
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSData *archiveData = [NSData dataWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:@"albums.plist"]];
    albums = [NSKeyedUnarchiver unarchiveObjectWithData:archiveData];
    [self.tableView reloadData];
}
@end
