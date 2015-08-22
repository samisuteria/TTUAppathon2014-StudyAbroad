//
//  PersonalInfoAddVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "PersonalInfoAddVC.h"
#import "NSData+AES.h"

@interface PersonalInfoAddVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation PersonalInfoAddVC

@synthesize itemNameField;
@synthesize password2Field;
@synthesize passwordField;
@synthesize imageView;
@synthesize pickImageButton;
@synthesize saveButton;

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
-(IBAction)backpressed{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)savePressed{
    
    [itemNameField resignFirstResponder];
    [passwordField resignFirstResponder];
    [password2Field resignFirstResponder];
    
    
    if(passwordField.text.length < 8){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Password is  too short" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    } else if (![passwordField.text isEqualToString:password2Field.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords don't match!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    } else {
        NSString *name = itemNameField.text;
        NSString *password = passwordField.text;
        UIImage *image = imageView.image;
        
        NSData *imageData = UIImageJPEGRepresentation(image, 100);
        NSData *encryptedImage = [imageData AES256EncryptWithKey:password];
        
        
        
        
    }
}

- (IBAction)chooseImage:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - Image Picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
