//
//  LoginVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "LoginVC.h"
#import <Parse/Parse.h>

@interface LoginVC ()

@end

@implementation LoginVC

@synthesize eraiderTextField;
@synthesize passwordTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginButtonPressed{
    NSLog(@"eraider: %@", eraiderTextField.text);
    [PFUser logInWithUsernameInBackground:eraiderTextField.text password:passwordTextField.text block:^(PFUser *user, NSError *error) {
        if(user){
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"Looks like there was an error logging in... lets try again" delegate:self cancelButtonTitle:@"Aww ok..." otherButtonTitles: nil];
            [alert show];
        }
    }];
}

-(IBAction)cancelPressed{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
