#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSDictionary<NSNumber*, NSString*> *digitAndMonth = @{
        @1 : @"January",
        @2 : @"February",
        @3 : @"March",
        @4 : @"April",
        @5 : @"May",
        @6 : @"June",
        @7 : @"July",
        @8 : @"August",
        @9 : @"September",
        @10 : @"October",
        @11 : @"November",
        @12 : @"December",
    };
    
    NSNumber *key = @(monthNumber);

    return [digitAndMonth objectForKey:key];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    
    NSDate *dateFromString = [formatter dateFromString: date];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components: NSCalendarUnitDay fromDate: dateFromString];

    return [dateComponents day];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"E"];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru"];
    [formatter setLocale: locale];
        
    return [formatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *currentDateComponents = [calendar components: NSCalendarUnitWeekOfYear fromDate: [NSDate now]];
    NSDateComponents *inputDateComponents = [calendar components: NSCalendarUnitWeekOfYear fromDate: date];
    
    return [currentDateComponents weekOfYear] == [inputDateComponents weekOfYear];
}

@end
