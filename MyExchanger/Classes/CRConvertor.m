//
//  Convertor.m
//  MyExchanger
//
//  Created by iMac on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Convertor.h"

@implementation Convertor

- (id)initWithCurencies:(NSDictionary *)curencies_{
  
  if(self=[super init]){
    curencies = curencies_;
  }
  
  return self;
}

- (NSArray*)allCurencyCharCode{
  return [curencies allKeys];
}

- (NSDecimalNumber*)curencyValueFrom:(NSString*)curencyChar{
  NSDictionary* curency =  [curencies objectForKey:curencyChar];
  NSString* string = [curency objectForKey:@"Value"];
  NSDecimalNumber* value =  [NSDecimalNumber decimalNumberWithString:string];
  string = [curency objectForKey:@"Nominal"];
  NSDecimalNumber* nominal =  [NSDecimalNumber decimalNumberWithString:string];
  return [value decimalNumberByDividingBy:nominal];
}


- (NSDecimalNumber*)convertValue:(NSDecimalNumber*)value fromCurency:(NSString*)from to:(NSString*)to{
  NSDecimalNumber* mdValue =[self convertAnyValToMD:value charCode:from];
  NSDecimalNumber* selectedVal =[self convertFromMDToAny:mdValue charCode:to];
  
  return selectedVal;
}

- (NSDecimalNumber*)convertAnyValToMD:(NSDecimalNumber*)amountVal charCode:(NSString*)charCode{
  NSDecimalNumber* amountUnit =[self curencyValueFrom:charCode];
  return [amountVal decimalNumberByMultiplyingBy:amountUnit];
}
- (NSDecimalNumber*)convertFromMDToAny:(NSDecimalNumber*)amountVal charCode:(NSString*)charCode{
  NSDecimalNumber* amountUnit =[self curencyValueFrom:charCode];
  return [amountVal decimalNumberByDividingBy:amountUnit];
}
@end
