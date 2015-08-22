//
//  EventDetailVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "EventDetailVC.h"

@interface EventDetailVC ()

@end

@implementation EventDetailVC

@synthesize placeName;
@synthesize labl;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //NSLog(@"%@",placeName);
    
    NSDictionary *niceNames = @{ @"barcelonafood": @"Barcelona",
                                 @"beachpyramid": @"The Pyramids",
                                 @"brazilvball": @"Brazil",
                                 @"camel": @"Egypt",
                                 @"chile": @"Chile",
                                 @"churrosChocolate": @"Spain!",
                                 @"Czech": @"Czech",
                                 @"czechmusic": @"Czech Music",
                                 @"groupclimb": @"Lets Climb!",
                                 @"pananabike": @"Panama!",
                                 @"spainClimb": @"Spain!",
                                 @"spainSoccer": @"Spain Soccer!",
                                 @"tajmahal": @"Taj Mahal",
                                 @"turtlehatch": @"Turtle Beach",
                                 @"dominicanrepublic": @"Dominican Republic!",
                                 @"francehighupeat": @"France!",
                                 @"hiddentemple": @"The Hidden Temple!",
                                 @"ireland": @"Ireland!",
                                 @"irelandpurplehouse": @"Ireland",
                                 @"koreanfood": @"Korea!",
                                 @"londonbridge": @"London Bridge!",
                                 @"londoneye": @"London!",
                                 @"machupichu": @"Machu Pichu",
                                 @"madrid": @"Madrid",
                                 @"moroccanvegetable": @"Morocco?",
                                 @"morocco": @"Morocco!"};
    
    labl.text = [niceNames objectForKey:placeName];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismissClicked{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:NULL];
}

@end
