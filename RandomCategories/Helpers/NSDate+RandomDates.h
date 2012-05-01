//
//  NSDate+RandomDates.h
//  Dash
//
//  Created by John Cadengo on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RelativeTimeSeconds = 0,
    RelativeTimeMinutes,
    RelativeTimeHours,
    RelativeTimeDays,
    RelativeTimeMonths,
    RelativeTimeYears
} RelativeTime;

@interface NSDate (RandomDates)

/** Generates a random date from within the relative time
 */
+ (NSDate *) randomDateWithinRelativeTime:(RelativeTime)relativeTime;

/** Generates a random date from within the relative time and returns its string representation
 */
+ (NSString *) randomRelativeTimestamp:(RelativeTime)relativeTime;

/** Adapted from an answer to a SO question:
    http://stackoverflow.com/questions/4937230/relative-string-from-nsdate/7734475#7734475
 
    Formats the date with simple demarcations: just now, minutes, hours, days, months, years
 */
- (NSString *)relativeTimestamp;

@end
