//
//  JokesSettingsViewController.m
//  FET
//
//  Created by Fahad Attique on 15/02/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

#import "JokesSettingsViewController.h"

@interface JokesSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *numberOfJokes;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarItem;

@end

@implementation JokesSettingsViewController

@synthesize numOfJokes;
@synthesize delegate;


#pragma mark Life Cycle

-(id)init {
    if (self = [super init])  {
    self.numOfJokes = @"20";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self validateNumberOfJokes];
    _numberOfJokes.text = numOfJokes;
}

#pragma Functions

-(void)validateNumberOfJokes {
    [_doneBarItem setEnabled:([_numberOfJokes.text integerValue] != 0)];
}


#pragma UITextfieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString * text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [_doneBarItem setEnabled:([text integerValue] != 0)];
    return true;
}


#pragma IBActions

- (IBAction)showJokes:(id)sender {
    
    numOfJokes = _numberOfJokes.text;
    
    if ([delegate conformsToProtocol:@protocol(JokesSettingsDelegate)]) {
        [delegate jokesSettingsViewController:self didProvideNumberOfJokes:numOfJokes];
    }
    
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
