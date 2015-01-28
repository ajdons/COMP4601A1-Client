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
#import "RKXMLReaderSerialization.h"

@interface CreateDocController ()

@end

@implementation CreateDocController
@synthesize  idField, nameField, textField, tagsField, linksField;
- (void)viewDidLoad {
    [super viewDidLoad];
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
    RKObjectMapping *documentMapping = [RKObjectMapping mappingForClass:[Document class]];
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:@"application/xml"];
    [[RKObjectManager sharedManager] setAcceptHeaderWithMIMEType:RKMIMETypeTextXML];
    
    
    [documentMapping addAttributeMappingsFromDictionary:@{@"id.text" : @"identifier",
                                                          @"score.text" : @"score",
                                                          @"name.text" : @"name",
                                                          @"text.text" : @"text",
                                                          @"tags.text" : @"tags",
                                                          @"links.text" : @"links"}];
    
    
    // Serialize the Article attributes then attach a file
    NSMutableURLRequest *request = [[RKObjectManager sharedManager] requestWithObject:doc method:RKRequestMethodPOST path:@"" parameters:nil];
    
    
    RKObjectRequestOperation *operation = [[RKObjectManager sharedManager] objectRequestOperationWithRequest:request success:nil failure:nil];
    [[RKObjectManager sharedManager] enqueueObjectRequestOperation:operation];

}


@end
