//
//  PlanTripWebVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "PlanTripWebVC.h"

@interface PlanTripWebVC ()

@end

@implementation PlanTripWebVC

@synthesize webAddress;
@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:webAddress ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@", [[NSBundle mainBundle] bundlePath]]];
    [webView loadHTMLString:htmlString baseURL:baseURL];
    
    if([webAddress isEqualToString:@"plantrip-appointment"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info Session" message:@"You must first complete an info session before schedule an appoitment." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backbuttonpressed{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
