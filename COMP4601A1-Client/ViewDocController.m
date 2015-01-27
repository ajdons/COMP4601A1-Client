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
@synthesize document, idLabel, nameField, textField, tagsField, linksField;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *idl = [[NSString alloc] initWithFormat:@"id: %@", [document identifier]];
    [idLabel setText:idl];
    [nameField setText:[document name]];
    [textField setText:[document text]];
    [tagsField setText:[[document tags] objectAtIndex:0]];
    [linksField setText:[[document links] objectAtIndex:0]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
