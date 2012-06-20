//
//  CommonMethods.m
//  MyExchanger
//
//  Created by iMac on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CommonMethods.h"

@implementation CommonMethods


+ (NSString*)getDateNow{
  
  NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
  NSDate *date = [NSDate date];
  NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:date];
  
  NSInteger day = [dateComponents day];
  NSInteger month = [dateComponents month];
  NSInteger year = [dateComponents year];
  return [NSString stringWithFormat:@"%d.%d.%d",day,month,year];
}

@end
