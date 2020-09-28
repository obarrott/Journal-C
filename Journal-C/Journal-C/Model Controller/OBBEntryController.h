//
//  EntryController.h
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBBEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBBEntryController : NSObject

//Properties
@property (nonatomic, strong) NSMutableArray *entries;

+ (OBBEntryController *) shared;

//Methods
- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

- (void)removeEntry:(OBBEntry *)entry;

- (void)updateEntry:(OBBEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;

@end

NS_ASSUME_NONNULL_END
