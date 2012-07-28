//
//  CommonMethods.h
//  MyExchanger
//
//  Created by iMac on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMethods : NSObject


+ (NSString*)getDate:(NSDate*)date;

+ (void)hide:(BOOL)hideView view:(UIView*)view animate:(BOOL)animate;
@end
