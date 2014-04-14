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
    albums = [[NSMutableArray alloc]init];

    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://dev.2amcode.com/corsoios/albums.php"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0 ];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSError *error;
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
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

@end
