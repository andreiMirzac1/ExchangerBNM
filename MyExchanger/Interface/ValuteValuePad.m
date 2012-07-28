//
//  ValuteValuePad.m
//  MyExchanger
//
//  Created by Mirzac Andrei on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ValuteValuePad.h"

@implementation ValuteValuePad
@synthesize valute1,valute2;
@synthesize delegate;
@synthesize charCode1,charCode2;
- (id)init
{
  NSArray * bundle = [[NSBundle mainBundle]loadNibNamed:@"ValuteValuePad" owner:self options:nil];
  for(id object in bundle){
    if([object isKindOfClass:[ValuteValuePad class]]){
      ValuteValuePad * currPad= (ValuteValuePad*)object;
      return currPad;
    }
  }
    return self;
}


-(void)didPressButton:(NSString *)strChar{
  NSString * padVal = valute1.text;

if([strChar isEqualToString:@"C"]){
  padVal = @"0";
}else{
  
  if([strChar isEqualToString:@","]){
    if([self hasDot:padVal]){
      return;
    }else  padVal  = [padVal stringByAppendingString:strChar];
    
  }else{
  if([padVal length] ==1 && [padVal isEqualToString:@"0"])
    padVal =@"";
  padVal  = [padVal stringByAppendingString:strChar];
  }
}
  valute1.text = padVal;
  [self.delegate ValuePadDidChangeValue:padVal];
}


- (BOOL)hasDot:(NSString*)str{
  NSCharacterSet* charSet = [NSCharacterSet characterSetWithCharactersInString:@","];
 NSRange range =  [str rangeOfCharacterFromSet:charSet];
  return range.location==NSNotFound?NO:YES;
}

@end
