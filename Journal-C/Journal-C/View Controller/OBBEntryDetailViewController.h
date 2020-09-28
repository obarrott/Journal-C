//
//  OBBEntryDetailViewController.h
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBBEntry.h"
#import "OBBEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBBEntryDetailViewController : UIViewController

//MARK: - Outlets
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

//MARK: - Properties
@property (nonatomic, strong) OBBEntry *entry;

//MARK: Actions
- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)clearButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
