//
//  NSArray+Helpers.m
//  Dash
//
//  Created by John Cadengo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Random.h"
#import "NSString+RandomStrings.h"

@implementation NSArray (Random)

+(id)arrayWithCount:(int)count ofRandomStringsOfLength:(int)len
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    // Make sure len is at least 1
    ++len;
    
    NSString *randomString;
    for (int i=0; i<count; ++i) {
        // Make sure we generate a string of length at least 1
        while (![randomString length]) {
            randomString = [NSString genRandStringLength:arc4random()%len];
        }
        
        // Then add it
        [arr addObject: randomString];
        
        // Reset
        randomString = nil;
    }
    
    return [NSArray arrayWithArray:arr];
}


-(id)randomObject
{
    NSUInteger randomIndex = arc4random() % [self count];
    return [self objectAtIndex:randomIndex];
}

@end
