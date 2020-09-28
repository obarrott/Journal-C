//
//  Entry.h
//  Journal-C
//
//  Created by Owen Barrott on 9/28/20.
//  Copyright © 2020 Cameron Stuart. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBBEntry : NSObject

//Properties
@property (nonatomic, copy, readonly) NSDate *timestamp;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *bodyText;

//Functions
- (instancetype) initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp;

@end

NS_ASSUME_NONNULL_END
