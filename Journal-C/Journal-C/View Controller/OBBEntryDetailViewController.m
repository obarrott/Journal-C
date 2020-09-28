//
//  OBBEntryDetailViewController.m
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import "OBBEntryDetailViewController.h"
#import "OBBEntryController.h"

@interface OBBEntryDetailViewController ()

@end

@implementation OBBEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}

- (IBAction)clearButtonTapped:(id)sender {
    _titleTextField.text = @"";
    _bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _titleTextField.text;
      NSString *bodyText = _bodyTextView.text;
      
    if(_entry == nil) {
          [OBBEntryController.shared addEntryWithTitle:title bodyText:bodyText];
      } else {
          [OBBEntryController.shared updateEntry:_entry title:title bodyText:bodyText];
      }
      [self.navigationController popViewControllerAnimated:true];
}
@end
