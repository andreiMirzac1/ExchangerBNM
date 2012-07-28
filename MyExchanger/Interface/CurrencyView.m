//
//  CurrencyView.m
//  MyExchanger
//
//  Created by Mirzac Andrei on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrencyView.h"

@implementation CurrencyView
@synthesize currency,currencyDelegate;

- (id)initWithCurrency:(NSDictionary*)currency_{
  self = [super initWithFrame:CGRectMake(0, 0, 320, 216)];
    if (self) {     
      currency =[NSDictionary dictionaryWithDictionary:currency_];
      if(currency_)[self setCurrency:currency_];
    }
    return self;
}

-(void)setCurrency:(NSDictionary *)currency_{
  currency =[NSDictionary dictionaryWithDictionary:currency_];
  isFilled = YES;
  keys  =[self sortArray:[currency_ allKeys]];
   self.showsSelectionIndicator = YES;
  self.delegate = self;
  self.dataSource =self;
  [self selectRow:0 inComponent:0 animated:YES];
  [self selectRow:0 inComponent:1 animated:YES];
}

- (NSArray*)sortArray:(NSArray*)array{
  NSSortDescriptor * sort= [[NSSortDescriptor alloc]initWithKey:@"" ascending:YES];

  return [array sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  [self.currencyDelegate currencyViewDidChangeCurrency:[keys objectAtIndex:row] inComponent:component];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  return [keys count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  return [keys objectAtIndex:row];
}
@end
