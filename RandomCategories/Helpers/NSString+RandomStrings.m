//
//  NSString+RandomStrings.m
//  Dash
//
//  Created by John Cadengo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+RandomStrings.h"
#import "NSArray+Helpers.h"
@implementation NSString (RandomStrings)
static NSString *letters = @"abcdefghijklmnopqrstuvwxyz";


+ (NSString *)randomStringOfMaxLength:(int)max
{
    max = arc4random()% max + 1;
    int len = 10;
    
    NSArray *arr = [NSArray arrayWithCount:max ofRandomStringsOfLength:len];
    NSMutableString *randomString = [NSMutableString stringWithCapacity:max];
    
    while ([randomString length] < max) {
        [randomString appendFormat:@"%@ ", [arr randomObject]];
    }
    
    return randomString;
}

+ (NSString *)genRandStringLength:(int)len 
{
    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%c", [letters characterAtIndex: arc4random()%[letters length]]];
    }
    
    return randomString;
}
@end
