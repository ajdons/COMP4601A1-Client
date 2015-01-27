//
//  SearchDocController.h
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDocController : UIViewController

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
-(IBAction)searchDoc:(id)sender;
@end
