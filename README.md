Random Categories
=================
Working on presenting data but don't care what the data actually is? Then these categories might help.

So far I've created categories on three classes,

* `NSArray+Random`
* `NSDate+RandomDates`
* `NSString+RandomStrings`

All of them are centered around the idea that you want new, fresh, and random data, but don't actually need it to be anything specific. Just to make sure that the spacing, layout, and design of what you're working on is accurate and flexible.

###Sample Project
I've included a `UITableViewController` which displays rows of data composed of random strings, random relative dates, and random images. If you scroll, the images will change each time it is refreshed, but the dates and strings will stay the same. Just to demonstrate the different ways of using the categories.

###Example Usage
Say you want to generate a random relative date, i.e. a timestamp to display in a `UITableViewCell`. You can do something like this,

    [NSDate randomDateWithinRelativeTime:RelativeTimeDays]
    
Which might spit out something along the lines of "just now", "5 minutes", "7 hours", or "23 days".

The options available are:

    typedef enum {
        RelativeTimeSeconds = 0,
        RelativeTimeMinutes,
        RelativeTimeHours,
        RelativeTimeDays,
        RelativeTimeMonths,
        RelativeTimeYears
    } RelativeTime;

###Screenshot
From the sample project,

![RandomCategories Screenshot](https://github.com/johncadengo/RandomCategories/raw/master/screenshot.png)

###Blessing
The images in the sample project are taken from [The Noun Project](http://thenounproject.com/).

The code is disclaimed from copyright. Instead of a legal notice, I offer a [blessing](http://www.sqlite.org/different.html),

> May you seek good and not evil.
>
> May you find forgiveness for yourself and the grace to forgive others.
>
> May you give freely knowing that all things you have were received.