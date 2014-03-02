//
//  AMCollectionViewController.m
//  Lezione2_a
//
//  Created by Andrea Maschio on 02/03/14.
//  Copyright (c) 2014 2AM Code. All rights reserved.
//

#import "AMCollectionViewController.h"
#import "AMCollectionViewCell.h"

@interface AMCollectionViewController ()

@end

@implementation AMCollectionViewController

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
    data = @[
             @"Penne al ragu",
             @"Maccheroni ai funghi",
             @"Bigoli alla pancetta",
             @"Spaghetti allo scoglio",
             @"Pizza",
             @"Vol au vent"
             ];
    colors = @[[UIColor grayColor],[UIColor darkGrayColor],[UIColor brownColor], [UIColor orangeColor], [UIColor blueColor], [UIColor purpleColor]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return  CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);//156,160
//}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [self.collectionViewLayout invalidateLayout];
 
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    AMCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    cell.myTextLabel.text = [data objectAtIndex:indexPath.row];
    cell.backgroundColor = [colors objectAtIndex:indexPath.row];
    cell.myImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpeg", indexPath.row+1]];
    return cell;
}
@end
