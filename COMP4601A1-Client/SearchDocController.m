//
//  SearchDocController.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//
#import <RestKit.h>
#import "SearchDocController.h"
#import "Document.h"
#import "SearchResultsController.h"
@interface SearchDocController ()

@property (nonatomic, strong) NSArray *docs;

@end

@implementation SearchDocController
@synthesize searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)searchDoc:(id)sender
{
    [self performSegueWithIdentifier:@"showresultssegue" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showresultssegue"]) {
        SearchResultsController *destViewController = segue.destinationViewController;
        destViewController.tags = searchBar.text;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
