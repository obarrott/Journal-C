//
//  EntryController.m
//  Journal-C
//
//  Created by Caleb Hicks on 12/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

#import "DMNEntryController.h"

static NSString * const EntriesKey = @"entries";

@implementation DMNEntryController

+ (DMNEntryController *)sharedController
{
	static DMNEntryController *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[DMNEntryController alloc] init];
		[sharedInstance loadFromPersistentStorage];
	});
	return sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		_entries = [NSMutableArray new];
	}
	return self;
}


#pragma mark - Add Entry
- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text
{
    DMNEntry *newEntry = [[DMNEntry alloc] initWithTitle:title text:text];
    
    [_entries addObject:newEntry];
    [self saveToPersistentStorage];
}

#pragma mark - Update Entry
- (void)updateEntry:(DMNEntry *)entry title:(NSString *)title text:(NSString *)text
{
    entry.title = title;
    entry.text = text;
    entry.timestamp = [NSDate date];
    [self saveToPersistentStorage];
}

#pragma mark - Remove Entry
- (void)removeEntry:(DMNEntry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)addDictObject:(DMNEntry *)entry;
{
    [_entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (DMNEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        DMNEntry *entry = [[DMNEntry alloc] initWithDictionary:dictionary];
        [self addDictObject:entry];
    }
}

@end
