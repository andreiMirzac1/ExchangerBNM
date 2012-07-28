//
//  CommonMethods.m
//  MyExchanger
//
//  Created by iMac on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CommonMethods.h"

@implementation CommonMethods


+ (NSString*)getDate:(NSDate*)date{
  NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
  NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;

  NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:date];
  
  NSInteger day = [dateComponents day];
  NSInteger month = [dateComponents month];
  NSInteger year = [dateComponents year];
  return [NSString stringWithFormat:@"%d.%d.%d",day,month,year];
}

+ (void)hide:(BOOL)hideView view:(UIView*)view animate:(BOOL)animate{
  
  CGPoint pt = hideView?CGPointMake(160, 570):CGPointMake(160, 352);
  if(animate)
  [UIView animateWithDuration:0.5f animations:^{
    view.center  =pt;
  }];
  else view.center  =pt; 
}
@end
