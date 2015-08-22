//
//  EventDetailVC.h
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailVC : UIViewController

@property NSString *placeName;
@property (weak, nonatomic) IBOutlet UILabel *labl;
@property (weak, nonatomic) IBOutlet UILabel *labl2;
@property (weak, nonatomic) IBOutlet UILabel *labl3;

@end
