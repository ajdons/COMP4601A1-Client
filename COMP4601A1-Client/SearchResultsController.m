//
//  SearchResultsController.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-28.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "SearchResultsController.h"
#import "ViewDocController.h"
#import <RestKit.h>
#import "RKXMLReaderSerialization.h"

@interface SearchResultsController ()
@property (nonatomic, strong) NSArray *docs;
@end

@implementation SearchResultsController 
@synthesize tableView, tags;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self loadDocuments];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
}


-(void) loadDocuments
{
    NSString *searchPath = [NSString stringWithFormat:@"/COMP4601A1/rest/sda/search/%@", tags];
    [[RKObjectManager sharedManager] getObjectsAtPath:searchPath
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  _docs = [mappingResult array];
                                                  
                                                  [self.tableView reloadData];
                                                  
                                                  for (Document * doc in _docs){
                                                      NSLog(@"In Results");
                                                      NSLog(@"id: %@", doc.identifier);
                                                  }
                                                  
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  [self sendBackWithAlert];
                                                  NSLog(@"What do you mean by 'there is no coffee?': %@", error);
                                              }];
    
    
}

-(void) sendBackWithAlert
{
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"No documents found"
                                                       message:@"Try another tag."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];

    [theAlert show];
}

-(IBAction)goBack:(id)sender
{
    NSLog(@"Button pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
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
