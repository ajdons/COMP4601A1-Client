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
    NSString *text = searchBar.text;
    [self configureRestKit];
    [self loadDocumentsFromTags:text];
    
    
}

-(void) loadDocumentsFromTags: (NSString*) tags
{
    NSString *base =@"http://localhost:8080/COMP4601A1/rest/sda/search/";
    
    NSString * path = [NSString stringWithFormat:@"%@%@ ", base, tags];
    
    NSLog(@"%@",path);
    
    
    
    [[RKObjectManager sharedManager] getObjectsAtPath:path
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  _docs = [mappingResult array];
                                                  
                                                 
                                                  
                                                  for (Document * doc in _docs){
                                                      NSLog(@"id: %@", doc.identifier);
                                                  }
                                                  
                                                  
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"What do you mean by 'there is no coffee?': %@", error);
                                              }];
    
    
}

- (void)configureRestKit
{
    NSURL *baseURL = [NSURL URLWithString:@"http://localhost:8080/COMP4601A1/rest/sda"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];

    RKObjectMapping *documentMapping = [RKObjectMapping mappingForClass:[Document class]];
    [documentMapping addAttributeMappingsFromDictionary:@{
                                                          @"id" : @"identifier",
                                                          @"score" : @"score",
                                                          @"name": @"name",
                                                          @"text": @"text",
                                                          @"tags": @"tags",
                                                          @"links" : @"links",
                                                          }];
    
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:documentMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:nil
                                                keyPath:@"document"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
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
