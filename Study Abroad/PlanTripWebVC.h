//
//  PlanTripWebVC.h
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanTripWebVC : UIViewController

@property NSString *webAddress;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
