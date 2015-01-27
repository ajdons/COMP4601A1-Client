//
//  SecondViewController.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "CreateDocController.h"
#import "Document.h"
#import <RestKit.h>
@interface CreateDocController ()

@end

@implementation CreateDocController
@synthesize  idField, nameField, textField, tagsField, linksField;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureRestKit];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)createDoc:(id)sender
{
    Document *doc = [Document new];
    [doc setIdentifier:[idField text]];
    [doc setName:[nameField text]];
    [doc setText:[textField text]];
    [doc setTags:[tagsField text]];
    [doc setLinks:[linksField text]];
}

- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://localhost:8080/COMP4601A1/rest/sda"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    // setup object mapping
    RKObjectMapping *documentMapping = [RKObjectMapping mappingForClass:[Document class]];
    [documentMapping addAttributeMappingsFromDictionary:@{
                                                          @"id" : @"identifier",
                                                          @"score" : @"score",
                                                          @"name": @"name",
                                                          @"text": @"text",
                                                          @"tags": @"tags",
                                                          @"links" : @"links",
                                                          }];
    
}

@end
