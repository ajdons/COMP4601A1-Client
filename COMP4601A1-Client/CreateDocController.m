//
//  SecondViewController.m
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import "CreateDocController.h"

@interface CreateDocController ()

@end

@implementation CreateDocController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)searchDoc:(id)sender
{
    NSLog(@"Create Button pressed!!!");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Document Created!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end
