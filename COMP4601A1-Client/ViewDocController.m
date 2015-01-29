//
//  ViewDocController.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-26.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "ViewDocController.h"

@interface ViewDocController ()

@end

@implementation ViewDocController
@synthesize document, idLabel, nameField, textField, tagsField, linksField, scoreField;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *idl = [[NSString alloc] initWithFormat:@"id: %@", [document identifier]];
    [idLabel setText:idl];
    [scoreField setText:[document score]];
    [nameField setText:[document name]];
    [textField setText:[document text]];
    [tagsField setText:[document tags]];
    [linksField setText:[document links]];
    
    NSLog(@"%@ %@ %@ %@ %@ %@", [document identifier], [document score], [document name], [document text], [document tags], [document links]);
    
    [scoreField setEnabled:false];
    [nameField setEnabled:false];
    [textField setEnabled:false];
    [tagsField setEnabled:false];
    [linksField setEnabled:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)edit:(id)sender
{
    [scoreField setEnabled:true];
    [nameField setEnabled:true];
    [textField setEnabled:true];
    [tagsField setEnabled:true];
    [linksField setEnabled:true];
}

- (IBAction)updateDoc:(id)sender {
    
    NSString *path = [NSString stringWithFormat:@"http://localhost:8080/COMP4601A1/rest/sda/%@",
                      [document identifier]];
    
    
    
    NSString *post = [NSString stringWithFormat:@"id=%@&score=%@&name=%@&text=%@&tags=%@&links=%@",
                      [document identifier], [scoreField text], [nameField text], [textField text], [tagsField text], [linksField text]];
    
    NSData *putData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *putLength = [NSString stringWithFormat:@"%lu", (unsigned long)[putData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:path]];
    [request setHTTPMethod:@"PUT"];
    [request setValue:putLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:putData];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
    NSLog(@"Conenction: %@", conn);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Document successfully updated, bitch!"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];

    
    
}

-(IBAction)goBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
