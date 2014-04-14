//
//  AMLinguaggioEditViewController.m
//  Lezione4_b
//
//  Created by Andrea Maschio on 23/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMAlbumEditViewController.h"

@interface AMAlbumEditViewController ()

@end

@implementation AMAlbumEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _txtAlbum.text = _album.title;
    _txtBand.text = _album.band;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)valueChanged:(id)sender {
    UISlider *s = (UISlider*)sender;
    s.value = round(s.value);
    _txtRating.text = [NSString stringWithFormat:@"%d",(int)s.value];
}

- (IBAction)saveAlbum:(id)sender {
    if(!self.album){
        self.album = [Album new];
        
    }
    self.album.title = _txtAlbum.text;
    self.album.band = _txtBand.text;
    self.album.rating = _ratingSlider.value;
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSData *archiveData = [NSData dataWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:@"albums.plist"]];
    NSMutableArray * albums = [NSKeyedUnarchiver unarchiveObjectWithData:archiveData];
    if([albums containsObject:_album]){
        [albums replaceObjectAtIndex:[albums indexOfObject:_album] withObject:_album];
    }else{
        [albums addObject:_album];
    }
    

    BOOL success = [NSKeyedArchiver archiveRootObject:albums toFile:[documentsDirectory stringByAppendingPathComponent:@"albums.plist"]];
    if(!success){
        NSLog(@"Error saving albums");
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
