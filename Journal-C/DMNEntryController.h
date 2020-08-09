//
//  EntryController.h
//  Journal-C
//
//  Created by Caleb Hicks on 12/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMNEntry.h"

@interface DMNEntryController : NSObject

@property (nonatomic, strong) NSMutableArray *entries;

+ (DMNEntryController *)sharedController;

- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text;
- (void)removeEntry:(DMNEntry *)entry;
- (void)updateEntry:(DMNEntry *)entry title:(NSString *)title text:(NSString *)text;

- (void)saveToPersistentStorage;

@end
