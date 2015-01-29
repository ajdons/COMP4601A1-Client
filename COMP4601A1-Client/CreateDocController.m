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
    
    NSDictionary *dic = @{@"id": @"testid",
                          @"score": @"testscore",
                          @"name": @"testname",
                          @"text": @"testext",
                          @"tags": @"testtags",
                          @"links": @"testlinks"};
    
//    RKObjectMapping *documentMapping = [RKObjectMapping mappingForClass:[Document class]];
    //[RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:@"application/xml"];
    //[[RKObjectManager sharedManager] setAcceptHeaderWithMIMEType:RKMIMETypeFormURLEncoded];
//    
//    
//    [documentMapping addAttributeMappingsFromDictionary:@{@"id.text" : @"identifier",
//                                                          @"score.text" : @"score",
//                                                          @"name.text" : @"name",
//                                                          @"text.text" : @"text",
//                                                          @"tags.text" : @"tags",
//                                                          @"links.text" : @"links"}];
    
    
    // Serialize the Article attributes then attach a file
    
    NSMutableURLRequest *request = [[RKObjectManager sharedManager] multipartFormRequestWithObject:doc method:RKRequestMethodPOST path:@"/COMP4601A1/rest/sda" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[@"12345" dataUsingEncoding:NSUTF8StringEncoding] name:@"id"];
        [formData appendPartWithFormData:[@"testname" dataUsingEncoding:NSUTF8StringEncoding] name:@"name"];
        [formData appendPartWithFormData:[@"testtext" dataUsingEncoding:NSUTF8StringEncoding] name:@"text"];
        [formData appendPartWithFormData:[@"testscore" dataUsingEncoding:NSUTF8StringEncoding] name:@"score"];
        [formData appendPartWithFormData:[@"testtags" dataUsingEncoding:NSUTF8StringEncoding] name:@"tags"];
        [formData appendPartWithFormData:[@"testlinks" dataUsingEncoding:NSUTF8StringEncoding] name:@"links"];
        
    }];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    
    [operation start];


//    [[RKObjectManager sharedManager] postObject:doc path:@"/COMP4601A1/rest/sda" parameters:dic
//                                        success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
//                                            NSLog(@"SUCCESS CREATE");
//                                        }
//     
//                                        failure:^(RKObjectRequestOperation *operation, NSError *error) {
//                                            NSLog(@"FAILURE CREATE");
//                                        }
//     ];
}

@end
