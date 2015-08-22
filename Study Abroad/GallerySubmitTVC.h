//
//  GallerySubmitTVC.h
//  TTU COMC
//
//  Created by Sami Suteria on 9/4/13.
//  Copyright (c) 2013 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "GalleryPhotoRulesVC.h"
//#import "GalleryAgreementVC.h"
#import "BSKeyboardControls.h"

@interface GallerySubmitTVC : UITableViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UITextFieldDelegate, BSKeyboardControlsDelegate>

@property (weak, nonatomic) IBOutlet UIButton *contestRulesButton;
@property (weak, nonatomic) IBOutlet UIButton *agreementButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *majorTextField;



@property (strong, nonatomic) BSKeyboardControls *keyboardControls;



@end
