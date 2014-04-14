//
//  AMViewController.m
//  Lezione5_a
//
//  Created by Andrea Maschio on 24/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMViewController.h"
#import "Album.h"

@interface AMViewController ()

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    albums = [NSMutableArray arrayWithArray:[Album MR_findAll]];

    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://dev.2amcode.com/corsoios/albums.php"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0 ];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSError *error;
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSArray *albumList = [dict objectForKey:@"albums"];
            
            for(id albumDict in albumList){
                Album *a = [Album MR_createEntity];
                a.title = [albumDict objectForKey:@"title"];
                a.band = [albumDict objectForKey:@"band"];
                a.rating = [[albumDict objectForKey:@"rating"] integerValue];
                NSError*e;
                [[NSManagedObjectContext MR_defaultContext]save:&e];
                if(e){
                    NSLog(@"error : %@", e);
                }
            }
        albums = [NSMutableArray arrayWithArray:[Album MR_findAll]];
      
            NSLog(@"Albums received: %@", albums);
            if(error){
                //gestione errore
            }
        }];
    

    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Ricevuto errore: %@", [error localizedDescription]);

}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse object.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [receivedData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [receivedData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  
    NSError *error;
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:&error];
    NSArray *albumList = [dict objectForKey:@"albums"];
    
    for(id albumDict in albumList){
        Album *a = [Album new];
        a.title = [albumDict objectForKey:@"title"];
        a.band = [albumDict objectForKey:@"band"];
        a.rating = [[albumDict objectForKey:@"rating"] integerValue];
        [albums addObject:a];
    }
    NSLog(@"Albums received: %@", albums);
    if(error){
        //gestione errore
    }
   
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

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

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

@end
