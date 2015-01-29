//
//  ViewDocController.h
//  COMP4601A1-Client
//
//  Created by Adam Donegan on 2015-01-26.
//  Copyright (c) 2015 Adam Donegan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Document.h"

@interface ViewDocController : UIViewController

@property (nonatomic, strong) Document *document;
@property (nonatomic) IBOutlet UILabel *idLabel;
@property (nonatomic) IBOutlet UITextField *nameField;
@property (nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) IBOutlet UITextField *tagsField;
@property (nonatomic) IBOutlet UITextField *linksField;
-(IBAction)edit:(id)sender;
-(IBAction)goBack:(id)sender;
-(IBAction)deleteDoc:(id)sender;
@end
