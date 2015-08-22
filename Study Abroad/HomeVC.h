//
//  HomeVC.h
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLScrollSelect.h"
#import "FXBlurView.h"


@interface HomeVC : UIViewController <KLScrollSelectDataSource, KLScrollSelectDelegate>

@property (strong, nonatomic) IBOutlet KLScrollSelect *scrollingView;
@property (weak, nonatomic) IBOutlet UIButton *mytripbutton;
@property (weak, nonatomic) IBOutlet UIButton *toolsbutton;
@property (weak, nonatomic) IBOutlet UIButton *settingsbutton;
@property (weak, nonatomic) IBOutlet UIButton *fbpostbutton;

@property (weak, nonatomic) IBOutlet FXBlurView *blurview;

@end
