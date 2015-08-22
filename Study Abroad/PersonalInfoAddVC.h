//
//  PersonalInfoAddVC.h
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoAddVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *itemNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *password2Field;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *pickImageButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end
