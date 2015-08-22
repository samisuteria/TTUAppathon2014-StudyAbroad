//
//  GalleryWinnerSingleVC.m
//  TTU COMC
//
//  Created by Sami Suteria on 10/11/13.
//  Copyright (c) 2013 Limerick Design. All rights reserved.
//

#import "GalleryWinnerSingleVC.h"

@interface GalleryWinnerSingleVC ()

@end

@implementation GalleryWinnerSingleVC

@synthesize winner;
@synthesize imageView;
@synthesize winnerLabel;
@synthesize activityindicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [activityindicator startAnimating];
    
    winnerLabel.text = [winner objectForKey:@"caption"];
    //self.navigationItem.title = [NSString stringWithFormat:@"%@ Winner", [winner objectForKey:@"DisplayDate"]];
    
    PFFile *imageFile = [winner objectForKey:@"pic"];
    imageView.file = imageFile;
    [imageView loadInBackground:^(UIImage *image, NSError *error) {
        [activityindicator stopAnimating];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backpressed{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
