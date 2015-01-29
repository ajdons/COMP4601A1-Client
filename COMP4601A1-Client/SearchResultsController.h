//
//  SearchResultsController.h
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-28.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
-(IBAction)goBack:(id)sender;
-(IBAction)deleteAll:(id)sender;
@property (strong, nonatomic) NSString *tags;
@end
