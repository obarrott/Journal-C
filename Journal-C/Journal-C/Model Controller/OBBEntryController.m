//
//  EntryController.m
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import "OBBEntryController.h"
#import "OBBEntry.h"

@implementation OBBEntryController

+ (OBBEntryController *)shared
{
    static OBBEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [OBBEntryController new];
    });
    return shared;
}

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _entries = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    OBBEntry *entry = [[OBBEntry alloc] initWithTitle:title bodyText:bodyText timestamp:[NSDate date]];
    [OBBEntryController.shared.entries addObject:entry];
}

- (void)removeEntry:(OBBEntry *)entry
{
    NSInteger index = [OBBEntryController.shared.entries indexOfObject:entry];
    [_entries removeObjectAtIndex:index];
}

- (void)updateEntry:(OBBEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    NSInteger index = [OBBEntryController.shared.entries indexOfObject:entry];
    OBBEntry *updatedEntry = [[OBBEntry alloc] initWithTitle:title bodyText:bodyText timestamp:[NSDate date]];
    [_entries replaceObjectAtIndex:index withObject:updatedEntry];
}
              

@end
