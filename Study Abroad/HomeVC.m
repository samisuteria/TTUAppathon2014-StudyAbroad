//
//  HomeVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "HomeVC.h"
#import <Parse/Parse.h>
#import "IBCellFlipSegue.h"
#import "EventDetailVC.h"
#import <Social/Social.h>

@interface HomeVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>



@end

@implementation HomeVC{
    NSArray *images;
    NSArray *leftimages;
    NSArray *rightimages;
    NSDictionary *leftImageSizes;
    NSString *placeSegue;
    UIImage *image;
}

@synthesize mytripbutton;
@synthesize toolsbutton;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    leftimages = [NSArray arrayWithObjects: @"barcelonafood",
                                            @"beachpyramid",
                                            @"brazilvball",
                                            @"camel",
                                            @"chile",
                                            @"churrosChocolate",
                                            @"Czech",
                                            @"czechmusic",
                                            @"groupclimb",
                                            @"pananabike",
                                            @"spainClimb",
                                            @"spainSoccer",
                                            @"tajmahal",
                                            @"turtlehatch",nil];
    
    leftImageSizes = @{ @"barcelonafood":@112,
                        @"beachpyramid":@100,
                        @"brazilvball":@112,
                        @"camel":@112,
                        @"chile":@112,
                        @"churrosChocolate":@100,
                        @"Czech":@112,
                        @"czechmusic":@96,
                        @"groupclimb":@100,
                        @"pananabike":@112,
                        @"spainClimb":@94,
                        @"spainSoccer":@112,
                        @"tajmahal":@102,
                        @"turtlehatch":@112 };
    
    
    
    rightimages = [NSArray arrayWithObjects:    @"dominicanrepublic",
                                                @"francehighupeat",
                                                @"hiddentemple",
                                                @"ireland",
                                                @"irelandpurplehouse",
                                                @"koreanfood",
                                                @"londonbridge",
                                                @"londoneye",
                                                @"machupichu",
                                                @"madrid",
                                                @"moroccanvegetable",
                                                @"morocco",nil];
    
    
    [self.scrollingView setDataSource: self];
    [self.scrollingView setDelegate: self];
    
    [self.scrollingView setBackgroundColor:[UIColor clearColor]];
    
    self.blurview.blurRadius = 40.0f;
    
}

-(void)viewWillAppear:(BOOL)animated{
    PFUser *currentUser = [PFUser currentUser];
    if(currentUser){
        [mytripbutton setTitle:@"My Trip" forState:UIControlStateNormal];
    } else {
        [mytripbutton setTitle:@"Plan Trip" forState:UIControlStateNormal];
    }
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue isMemberOfClass:[IBCellFlipSegue class]]){
        IBCellFlipSegue *cellFlipSegue = (IBCellFlipSegue *)segue;
        cellFlipSegue.selectedCell = sender;
        cellFlipSegue.flipAxis = FlipAxisVertical;
    }
    
    EventDetailVC *vc = (EventDetailVC *)[segue destinationViewController];
    [vc setPlaceName:placeSegue];
}

-(IBAction)settingsPressed{
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-Settings"];
    [self.navigationController pushViewController:view animated:YES];
}


-(IBAction)otherAction:(id)sender{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"somevc"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)tripButtonPressed{
    
    PFUser *currentUser = [PFUser currentUser];
    if(currentUser){
        UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-MyTrip"];
        [self.navigationController pushViewController:view animated:YES];
    } else {
        UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-PlanTrip"];
        [self.navigationController pushViewController:view animated:YES];
    }

}

-(IBAction)toolsButtonPressed{
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-Tools"];
    [self.navigationController pushViewController:view animated:YES];
}


- (void)didSelectFacebookButton:(id)sender {
    SLComposeViewController* shareViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    NSLog(@"got to facebook");
    
    [shareViewController addImage:image];
    [shareViewController setInitialText:@"I love studying abroud through Texas Tech!"];
    
    if ([SLComposeViewController isAvailableForServiceType:shareViewController.serviceType]) {
        [self presentViewController:shareViewController
                           animated:YES
                         completion: nil];
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)aimage editingInfo:(NSDictionary *)editingInfo
{
    image = aimage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(NSInteger)scrollSelect:(KLScrollSelect *)scrollSelect numberOfRowsInColumnAtIndex:(NSInteger)index{
    if(index == 0){
        return [leftimages count];
    } else {
        return [rightimages count];
    }
}

- (CGFloat)scrollRateForColumnAtIndex: (NSInteger) index {
    
    if(index==0){
        return 20;
    } else {
        return 15;
    }
    
    
}

-(NSInteger) numberOfColumnsInScrollSelect:(KLScrollSelect *)scrollSelect {
    return 2;
}

- (void)scrollSelect:(KLScrollSelect *)tableView didSelectCellAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"Selected cell at index %d, %d, %d", indexPath.column, indexPath.section, indexPath.row);
    
    if(indexPath.column == 0){
        //NSLog(@"name: %@", [leftimages objectAtIndex:indexPath.row]);
        placeSegue = [leftimages objectAtIndex:indexPath.row];
    } else {
        //NSLog(@"name: %@", [rightimages objectAtIndex:indexPath.row]);
        placeSegue = [rightimages objectAtIndex:indexPath.row];
    }
    
    [self performSegueWithIdentifier:@"eventClicked" sender:[tableView cellForRowAtIndexPath:indexPath]];
    
}
- (CGFloat) scrollSelect: (KLScrollSelect*) scrollSelect heightForColumnAtIndex: (NSInteger) index {
    if(index==0){
        return 112;
    } else {
        return 225;
    }
}

-(UITableViewCell *)scrollSelect:(KLScrollSelect *)scrollSelect cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLScrollingColumn* column = [[scrollSelect columns] objectAtIndex: indexPath.column];
    KLImageCell* cell;
    
    [column registerClass:[KLImageCell class] forCellReuseIdentifier:@"Cell" ];
    cell = [column dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    [cell setSelectionStyle: UITableViewCellSelectionStyleNone];
    
    if(indexPath.column == 0){
        [cell.image setImage:[UIImage imageNamed:[leftimages objectAtIndex:indexPath.row]]];
    } else {
        [cell.image setImage:[UIImage imageNamed:[rightimages objectAtIndex:indexPath.row]]];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
