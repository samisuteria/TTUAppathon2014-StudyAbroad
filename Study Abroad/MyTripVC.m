//
//  MyTripVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "MyTripVC.h"
#import "PlanTripWebVC.h"
#import <Parse/Parse.h>

@interface MyTripVC () {
    NSArray *menuItems;
    NSArray *webPages;
    NSArray *menuPics;
}

@end

@implementation MyTripVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    menuItems = [NSArray arrayWithObjects:  @"Events/Calendar",
                                            @"Communication",
                                            @"Weekly Forecast",
                                            @"Leave Feedback",
                                            @"Map",
                                            @"Safety Tips",
                                            @"Contact TTU",
                                            @"Photo Contest", nil];
    
    webPages = [NSArray arrayWithObjects:   @"mytrip-events",
                                            @"mytrip-communications",
                                            @"mytrip-forecast",
                                            @"mytrip-feedback",
                                            @"mytrip-map",
                                            @"mytrip-safety",
                                            @"mytrip-contact-ttu",nil];
    
    menuPics = [NSArray arrayWithObjects:   @"com.png",
                                            @"travel.png",
                                            @"forecast.png",
                                            @"feedback.png",
                                            @"map.png",
                                            @"security.png",
                                            @"box.png",
                                            @"star.png", nil];
    
    
    [self.navigationController.navigationBar setHidden:NO];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)homebuttonpressed{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(IBAction)logout{
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    if ([self.tableView indexPathForSelectedRow]) {
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }
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
    return [menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlanTripCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = [menuItems objectAtIndex:indexPath.row];
    
    UIImageView *image = (UIImageView *)[cell viewWithTag:10];
    image.image = [UIImage imageNamed:[menuPics objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"row: %d",indexPath.row);
    
    if(indexPath.row != 7){
        PlanTripWebVC *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-PlanTripWeb"];
        [view setWebAddress:[webPages objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 7){
        UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-PhotoContest"];
        [self.navigationController pushViewController:view animated:YES];
        
    }
    
    
    
}

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

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
