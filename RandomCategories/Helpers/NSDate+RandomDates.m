//
//  NSDate+RandomDates.m
//  Dash
//
//  Created by John Cadengo on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDate+RandomDates.h"

@implementation NSDate (RandomDates)

static const int SECOND = 1;
static const int MINUTE = 60 * SECOND;
static const int HOUR = 60 * MINUTE;
static const int DAY = 24 * HOUR;
static const int MONTH = 30 * DAY;
static const int YEAR = 12 * MONTH;

+ (NSDate *) randomDateWithinRelativeTime:(RelativeTime)relativeTime
{
    NSInteger unit;
    
    switch (relativeTime) {
        case RelativeTimeSeconds:
            unit = MINUTE;
            break;
        case RelativeTimeMinutes:
            unit = HOUR;
            break;
        case RelativeTimeHours:
            unit = DAY;
            break;
        case RelativeTimeDays:
            unit = MONTH;
            break;
        case RelativeTimeMonths:
            unit = YEAR;
            break;
        case RelativeTimeYears:
            unit = [NSDate timeIntervalSinceReferenceDate];
            break;
        default:
            NSAssert(NO, @"Supplied a RelativeTime value that does not exist: %d", relativeTime);
            break;
    }
    
    NSTimeInterval randomTimeInterval = arc4random() % unit;
    NSDate *randomDate = [NSDate dateWithTimeIntervalSinceNow:randomTimeInterval * -1.0];
    
    return randomDate;
}

+ (NSString *) randomRelativeTimestamp:(RelativeTime)relativeTime
{
    NSDate *randomDate = [self randomDateWithinRelativeTime:relativeTime];
    return [randomDate relativeTimestamp];
}

- (NSString *)relativeTimestamp
{
    NSDate *now = [NSDate date];
    NSTimeInterval delta = [self timeIntervalSinceDate:now] * -1.0;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger units = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    NSDateComponents *components = [calendar components:units fromDate:self toDate:now options:0];
    
    NSString *relativeString;
    
    if (delta < 0) {
        relativeString = @"not yet";
        
    } else if (delta < 2 * MINUTE) {
        relativeString =  @"just now";
        
    } else if (delta < 45 * MINUTE) {
        relativeString = [NSString stringWithFormat:@"%d minutes",components.minute];
        
    } else if (delta < 90 * MINUTE) {
        relativeString = @"1 hour";
        
    } else if (delta < 24 * HOUR) {
        relativeString = [NSString stringWithFormat:@"%d hours",components.hour];
        
    } else if (delta < 48 * HOUR) {
        relativeString = @"1 day";
        
    } else if (delta < 30 * DAY) {
        relativeString = [NSString stringWithFormat:@"%d days",components.day];
        
    } else if (delta < 12 * MONTH) {
        relativeString = (components.month <= 1) ? @"1 month" : [NSString stringWithFormat:@"%d months",components.month];
        
    } else {
        relativeString = (components.year <= 1) ? @"1 year" : [NSString stringWithFormat:@"%d years",components.year];
    }
    
    return [NSString stringWithFormat: @"%@", relativeString];
} 

@end
