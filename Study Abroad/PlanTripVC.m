//
//  PlanTripVC.m
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import "PlanTripVC.h"
#import "PlanTripWebVC.h"

@interface PlanTripVC () {
    NSArray *menuItems;
    NSArray *webPages;
    NSArray *menuPics;
}

@end

@implementation PlanTripVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    menuItems = [NSArray arrayWithObjects:  @"Program Overview",
                                            @"Why Study Abroad",
                                            @"Application Process",
                                            @"Schedule an Appt",
                                            @"Travel Checklist",
                                            @"Financial Aid",nil];
    
    webPages = [NSArray arrayWithObjects:   @"plantrip-programOverview",
                                            @"plantrip-whystudy",
                                            @"plantrip-app-process",
                                            @"plantrip-appointment",
                                            @"plantrip-checklist",
                                            @"plantrip-finaid", nil];
    
    menuPics = [NSArray arrayWithObjects:  @"star.png",
                 @"feedback.png",
                 @"box.png",
                 @"com.png",
                 @"travel.png",
                 @"currency.png",nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)homebuttonpressed{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(IBAction)loginPressed{
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-Login"];
    [self.navigationController pushViewController:view animated:YES];
    
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

- (void) viewWillAppear:(BOOL)animated {
    if ([self.tableView indexPathForSelectedRow]) {
        [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"row: %d",indexPath.row);
    if(indexPath.row < 6){
        PlanTripWebVC *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SB-PlanTripWeb"];
        [view setWebAddress:[webPages objectAtIndex:indexPath.row]];
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
