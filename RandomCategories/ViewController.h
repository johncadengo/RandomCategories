//
//  ViewController.h
//  RandomCategories
//
//  Created by John Cadengo on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Can change this number to make any number of rows we wish.
enum {
    kRandomStringLength = 8,
    kNumRows = 16,
};

@interface ViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *randomDates;
@property (nonatomic, strong) NSMutableArray *randomStrings;
@property (nonatomic, strong) NSArray *images;

- (void)populateArrays;

@end
