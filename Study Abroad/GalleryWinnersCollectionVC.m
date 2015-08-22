//
//  GalleryWinnersCollectionVC.m
//  TTU COMC
//
//  Created by Sami Suteria on 10/11/13.
//  Copyright (c) 2013 Limerick Design. All rights reserved.
//

#import "GalleryWinnersCollectionVC.h"
#import "GalleryWinnerSingleVC.h"
#import "GalleryWinnersCollectionHeaderView.h"
#import <Parse/Parse.h>

@interface GalleryWinnersCollectionVC (){
    NSArray *winners;
}

@end

@implementation GalleryWinnersCollectionVC

@synthesize mainActivityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_bg"]];
    self.collectionView.backgroundView = imageView;
	
    winners = nil;
    
    [mainActivityIndicator startAnimating];
    
    PFQuery *query = [PFQuery queryWithClassName:@"PastWinners"];
    [query orderByDescending:@"SortDate"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            winners = objects;
            [self.collectionView reloadData];
            [mainActivityIndicator stopAnimating];
        } else {
            [mainActivityIndicator stopAnimating];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error loading the contest winners." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [winners count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"GalleryCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    UIActivityIndicatorView *aic = (UIActivityIndicatorView *)[cell viewWithTag:30001];
    [aic startAnimating];
    
    PFImageView *imageView = (PFImageView *)[cell viewWithTag:3000];
    //imageView.image = [UIImage imageNamed:[pics objectAtIndex:indexPath.row]];
    PFObject *winner = [winners objectAtIndex:indexPath.row];
    PFFile *thumbnailFile = [winner objectForKey:@"thumbnail"];
    imageView.file = thumbnailFile;
    [imageView loadInBackground:^(UIImage *image, NSError *error) {
        [aic stopAnimating];
    }];
    
    [aic stopAnimating];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"galleryWinnerSingle"]){
        NSArray *indexpaths = [self.collectionView indexPathsForSelectedItems];
        GalleryWinnerSingleVC *vc = segue.destinationViewController;
        NSIndexPath *indexpath = [indexpaths objectAtIndex:0];
        vc.winner = [winners objectAtIndex:indexpath.row];
        [self.collectionView deselectItemAtIndexPath:indexpath animated:NO];
    }
}

-(IBAction)backpressed{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusable = nil;
    
    if(kind == UICollectionElementKindSectionHeader){
        GalleryWinnersCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GalleryHeader" forIndexPath:indexPath];
        header.titleLable.text = @"Winners: 2013";
        reusable = header;
    }
    
    return reusable;
}


@end
