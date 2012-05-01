//
//  NSString+RandomStrings.h
//  Dash
//
//  Created by John Cadengo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RandomStrings)

+ (NSString *)randomStringOfMaxLength:(int)max;
+ (NSString *)genRandStringLength:(int)len;

@end
