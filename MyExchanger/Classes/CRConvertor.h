//  Convertor.h
//  MyExchanger
//
//  Created by iMac on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.


#import <Foundation/Foundation.h>

@interface Convertor : NSObject{
  
  NSDictionary* curencies;
}
- (id)initWithCurencies:(NSDictionary*)curencies;
- (NSDecimalNumber*)convertValue:(NSDecimalNumber*)value fromCurency:(NSString*)from to:(NSString*)to;
- (NSDecimalNumber*)curencyValueFrom:(NSString*)curencyChar;
- (NSArray*)allCurencyCharCode;



//Added To header only for testing
//Convertors 
//- (NSDecimalNumber*)convertAnyValToMD:(NSDecimalNumber*)amountVal charCode:(NSString*)charCode;
//- (NSDecimalNumber*)convertFromMDToAny:(NSDecimalNumber*)amountVal charCode:(NSString*)charCode;

@end
