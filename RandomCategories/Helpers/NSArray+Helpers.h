//
//  NSArray+Helpers.h
//  Dash
//
//  Created by John Cadengo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Random)

+(id)arrayWithCount:(int)count ofRandomStringsOfLength:(int)len;
-(id)randomObject;

@end
