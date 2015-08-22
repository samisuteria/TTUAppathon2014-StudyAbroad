//
//  GallerySubmitTVC.m
//  TTU COMC
//
//  Created by Sami Suteria on 9/4/13.
//  Copyright (c) 2013 Limerick Design. All rights reserved.
//

#import "GallerySubmitTVC.h"
#import <Parse/Parse.h>
#import "UIImageExtras.h"
#import "DAProgressOverlayView.h"
#import "BSKeyboardControls.h"

@interface GallerySubmitTVC () {
    UIImagePickerController *imagePicker;
    DAProgressOverlayView *imageProgressOverlay;
}

@end

@implementation GallerySubmitTVC

@synthesize submitButton;
@synthesize imageView;
@synthesize agreementButton;
@synthesize contestRulesButton;
@synthesize nameTextField;
@synthesize emailTextField;
@synthesize lastNameTextField;
@synthesize majorTextField;



@synthesize keyboardControls;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imageView.image = [UIImage imageNamed:@"photosubmit"];
    
    
    // Assign our own backgroud for the view
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    [self.parentViewController.view setOpaque:NO];
    
    
    //[self showRules];
    
    
    NSArray *fields = @[self.nameTextField, self.lastNameTextField, self.emailTextField, self.majorTextField];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];
    
}


#pragma mark - Keyboard Controls

-(void)keyboardControlsDonePressed:(BSKeyboardControls *)akeyboardControls{
    [akeyboardControls.activeField resignFirstResponder];
}

-(void)keyboardControls:(BSKeyboardControls *)akeyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction{
    UIView *view = akeyboardControls.activeField.superview.superview;
    
    [self.tableView scrollRectToVisible:view.frame animated:YES];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.keyboardControls setActiveField:textField];
}

- (void)viewDidAppear:(BOOL)animated {
    /*
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"NoPhotoRules"]){
        [self showAgreement];
    }
    */
    
}
/*
-(void)showRules{
    
    [self.keyboardControls.activeField resignFirstResponder];
    
    rulesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoRules"];
    UIView *view = rulesVC.view;
    view.opaque = NO;
    view.alpha = 0.9f;
    rulesVC.delegate = self;
    
    
    CGRect mainrect = [[UIScreen mainScreen] bounds];
    CGRect newRect = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);
    
    
    [self.view addSubview:view];
    view.frame = newRect;
    
    [UIView animateWithDuration:0.8
                     animations:^{
                         view.frame = mainrect;
                     } completion:^(BOOL finished) {
                         //nop
                     }];
     
}


-(void)dismissRules{
    CGRect mainrect = [[UIScreen mainScreen] bounds];
    CGRect newRect = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);
    [UIView animateWithDuration:0.8
                     animations:^{
                         self.rulesVC.view.frame = newRect;
                     } completion:^(BOOL finished) {
                         [self.rulesVC.view removeFromSuperview];
                         self.rulesVC = nil;
                     }];
}

-(void)showAgreement{
    agreementVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoAgree"];
    UIView *view = agreementVC.view;
    view.opaque = NO;
    view.alpha = 0.9f;
    agreementVC.delegate = self;
    
    
    CGRect mainrect = [[UIScreen mainScreen] bounds];
    CGRect newRect = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);
    
    
    [self.view addSubview:view];
    view.frame = newRect;
    
    [UIView animateWithDuration:0.8
                     animations:^{
                         view.frame = mainrect;
                     } completion:^(BOOL finished) {
                         //nop
                     }];
}


-(void)dismissAgreement{
    CGRect mainrect = [[UIScreen mainScreen] bounds];
    CGRect newRect = CGRectMake(0, mainrect.size.height, mainrect.size.width, mainrect.size.height);
    [UIView animateWithDuration:0.8
                     animations:^{
                         self.agreementVC.view.frame = newRect;
                     } completion:^(BOOL finished) {
                         [self.agreementVC.view removeFromSuperview];
                         self.agreementVC = nil;
                     }];
}
*/
 
- (IBAction)handleUploadPhotoTouch:(id)sender {
    imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    imagePicker.allowsEditing = NO;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Take Photo", @"Choose Existing", nil];
        [actionSheet showInView:self.view];
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else if (buttonIndex == 1) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else if (buttonIndex == 2) {
        
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];

    
    self.imageView.image = [image imageByScalingAndCroppingForSize:CGSizeMake(640, 940)];
    
    //self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)noImagePicked {
    
    NSData *data1 = UIImagePNGRepresentation(imageView.image);
    NSData *data2 = UIImagePNGRepresentation([UIImage imageNamed:@"photosubmit"]);
    
    return [data1 isEqualToData:data2];
    
}


-(IBAction)submitButtonClicked{
    
    [nameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [majorTextField resignFirstResponder];
    
    
    if ([self noImagePicked]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please select an picture before entering the contest"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        
        
    } else if((nameTextField.text.length > 0) && (lastNameTextField.text.length > 0) && (emailTextField.text.length > 0)){
        
        PFFile *uploadImage = [PFFile fileWithData:UIImageJPEGRepresentation(self.imageView.image, 1.0f)];
        
        imageProgressOverlay = [[DAProgressOverlayView alloc] initWithFrame:self.imageView.bounds];
        [self.imageView addSubview:imageProgressOverlay];
        [imageProgressOverlay displayOperationWillTriggerAnimation];
        self.submitButton.enabled = NO;
        [self.submitButton setTitle:@"Submitting..." forState:UIControlStateNormal];
        
        [uploadImage saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(succeeded){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submitting Image"
                                                                message:@"Thank you for your entry into the photography contest!"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
                
                
                [alert show];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submitting Image"
                                                                message:@"There was an error submitting your image. Please try again."
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
                
                
                [alert show];
            }
        } progressBlock:^(int percentDone) {
            //NSLog(@"percentDone: %i",percentDone);
            float progress = (float)percentDone/100.0;
            //NSLog(@"progress: %f",progress);
            imageProgressOverlay.progress = progress;
        }];
        
        NSString *majorUpload = majorTextField.text;
        if(majorUpload.length == 0){
            majorUpload = @"No Major Given";
        }
        
        PFObject *submission = [PFObject objectWithClassName:@"GallerySubmission"];
        [submission setObject:uploadImage forKey:@"submissionPic"];
        [submission setValue:nameTextField.text forKey:@"FirstName"];
        [submission setValue:emailTextField.text forKey:@"Email"];
        [submission setValue:lastNameTextField.text forKey:@"LastName"];
        [submission setValue:majorUpload forKey:@"Major"];
        
        
        [submission saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(succeeded){
                self.submitButton.enabled = YES;
                imageProgressOverlay.hidden = YES;
                [self.submitButton setTitle:@"Submit" forState:UIControlStateNormal];
            }
        }];
        
        /*
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submitting Image"
                                                        message:@"Thank you for your entry into the photography contest!"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        
        
        [alert show];
        */
        
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please fill out all fields before submitting your picture."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    
}

-(IBAction)backpressed{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)rulesButtonPressed{
    
    //[self showRules];
}

-(IBAction)agreementButtonPressed{
    
    //[self showAgreement];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
}

-(IBAction)backgroundTapped{
    [nameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [majorTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 375;
}
*/
/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 static NSString *CellIdentifier = @"Cell";
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
