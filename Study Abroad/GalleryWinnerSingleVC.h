//
//  GalleryWinnerSingleVC.h
//  TTU COMC
//
//  Created by Sami Suteria on 10/11/13.
//  Copyright (c) 2013 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFImageView.h>

@interface GalleryWinnerSingleVC : UIViewController

@property (weak, nonatomic) PFObject *winner;
@property (weak, nonatomic) IBOutlet PFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityindicator;

@end
