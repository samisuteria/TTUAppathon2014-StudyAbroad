//
//  GalleryWinnersCollectionVC.h
//  TTU COMC
//
//  Created by Sami Suteria on 10/11/13.
//  Copyright (c) 2013 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryWinnersCollectionVC : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *mainActivityIndicator;


@end
