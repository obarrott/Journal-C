//
//  Entry.m
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import "OBBEntry.h"

@implementation OBBEntry

- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
                    timestamp:(NSDate *)timestamp
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}
@end
