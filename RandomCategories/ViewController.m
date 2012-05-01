//
//  ViewController.m
//  RandomCategories
//
//  Created by John Cadengo on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Helpers.h"
#import "NSDate+RandomDates.h"
#import "NSString+RandomStrings.h"

@implementation ViewController

@synthesize randomDates = _randomDates;
@synthesize randomStrings = _randomStrings;
@synthesize images = _images;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Initialize the arrays of data which we will use to populate our table view cells.
        self.randomDates = [[NSMutableArray alloc] initWithCapacity:kNumRows];
        self.randomStrings = [[NSMutableArray alloc] initWithCapacity:kNumRows];
        
        // These images are located in the images folder.
        self.images = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"Beer"],
                       [UIImage imageNamed:@"Bread"],
                       [UIImage imageNamed:@"Burger"],
                       [UIImage imageNamed:@"Coffee"],
                       [UIImage imageNamed:@"Cupcake"],
                       [UIImage imageNamed:@"Egg"],
                       [UIImage imageNamed:@"FastFood"],
                       [UIImage imageNamed:@"Fish"],nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Populate our arrays with random data.
    [self populateArrays];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // We only need one section.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kNumRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RandomCategoriesCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up our labels. The main label will be our random string.
    cell.textLabel.text = [self.randomStrings objectAtIndex:indexPath.row];
    
    // The detail label will be the timestamp.
    // Notice that we take the NSDate object and apply the relativeTimestamp method to it.
    cell.detailTextLabel.text = [[self.randomDates objectAtIndex:indexPath.row] relativeTimestamp];
    
    // Also, we'd like to have an image, here we use the randomObject method.
    [cell.imageView setImage:[self.images randomObject]];
    
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Populate

- (void)populateArrays
{
    // First let's empty out our arrays.
    [self.randomStrings removeAllObjects];
    [self.randomDates removeAllObjects];
    
    // Now, fill up our random strings array with some random strings.
    self.randomStrings = [NSMutableArray arrayWithCount:kNumRows ofRandomStringsOfLength:kRandomStringLength];
    
    // And our random dates array with some random dates.
    for (int i = 0; i < kNumRows; i++) {
        // This will return random dates ranging from the present to less than a month ago.
        [self.randomDates addObject:[NSDate randomDateWithinRelativeTime:RelativeTimeDays]];
    }
    
    // Make sure we update our table view to reflect the newly created data.
    [self.tableView reloadData];
}

@end
