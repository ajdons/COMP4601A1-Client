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

    
    [self configureRestKit];
    [self loadDocuments];
   

    
    
       // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"AYYYY");
    NSLog(@"AYYYY");
    [self loadDocuments];
    [super viewWillAppear:animated];
    [self.tableView reloadData]; // to reload selected cell
}


-(void) loadDocuments
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/COMP4601A1/rest/sda/documents"
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  _docs = [mappingResult array];
                                                  
                                                  [self.tableView reloadData];
                                                  
                                                  for (Document * doc in _docs){
                                                      NSLog(@"id: %@", doc.tags);
                                                  }
                                                  
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"What do you mean by 'there is no coffee?': %@", error);
                                              }];
    
    
}

- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://localhost:8080/COMP4601A1/rest/sda"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:@"application/xml"];
    [[RKObjectManager sharedManager] setAcceptHeaderWithMIMEType:RKMIMETypeTextXML];
    

    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    // setup object mapping
    RKObjectMapping *documentMapping = [RKObjectMapping mappingForClass:[Document class]];

    
    [documentMapping addAttributeMappingsFromDictionary:@{@"id.text" : @"identifier",
                                                          @"score.text" : @"score",
                                                          @"name.text" : @"name",
                                                          @"text.text" : @"text",
                                                          @"tags.text" : @"tags",
                                                          @"links.text" : @"links"}];

    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:documentMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:nil
                                                keyPath:@"documents.document"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    

    
    
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
