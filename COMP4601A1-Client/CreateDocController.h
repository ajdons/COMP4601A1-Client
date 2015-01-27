//
//  SecondViewController.h
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-24.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateDocController : UIViewController

@property (nonatomic) IBOutlet UITextField *idField;
@property (nonatomic) IBOutlet UITextField *nameField;
@property (nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) IBOutlet UITextField *tagsField;
@property (nonatomic) IBOutlet UITextField *linksField;
-(IBAction)createDoc:(id)sender;

@end

