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
   
    NSString *post = [NSString stringWithFormat:@"id=%@&score=%@&name=%@&text=%@&tags=%@&links=%@",
                      [doc identifier], @"33", [doc name], [doc text], [doc tags], [doc links]];

    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://localhost:8080/COMP4601A1/rest/sda/"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    
    NSLog(@"Conenction: %@", conn);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Document successfully added, bitch!"
                                                       message:@""
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    
    [alert show];
}



@end
