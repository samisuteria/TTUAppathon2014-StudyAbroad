//
//  ToolsVC.h
//  Study Abroad
//
//  Created by Sami Suteria on 2/22/14.
//  Copyright (c) 2014 Limerick Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolsVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
