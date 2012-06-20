//
//  CurrencyPadView.m
//  MyExchanger
//
//  Created by Mirzac Andrei on 20.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrencyPadView.h"

@implementation CurrencyPadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      pickerView.delegate =self;
      pickerView.dataSource =self;
    }
    return self;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  NSLog(@"asfkslfjlsk");
  return @"abcd";
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  return 5;
}


@end
