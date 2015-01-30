//
//  FirstViewController.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "LibraryController.h"
#import <RestKit.h>
#import "Document.h"
#import "RKXMLReaderSerialization.h"
#import "ViewDocController.h"

@interface LibraryController ()
@property (nonatomic, strong) NSArray *docs;
@end

@implementation LibraryController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    _docs = NULL;
    [self loadDocuments];
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


-(void) loadDocuments
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/COMP4601A1/rest/sda/documents"
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  _docs = [mappingResult array];
                                                  
                                                  
                                                  
                                                  [self.tableView reloadData];
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"No documents found: \n%@", error);
                                              }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_docs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[_docs objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"docviewsegue" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"docviewsegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ViewDocController *destViewController = segue.destinationViewController;
        destViewController.document = [_docs objectAtIndex:indexPath.row];
    }
}

@end
