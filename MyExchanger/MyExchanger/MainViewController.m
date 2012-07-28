//
//  MainViewController.m
//  MyExchanger
//
//  Created by iMac on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "MainViewController.h"


typedef enum Mode{
kModeCalculator=0,
kModeCurrency,
kModeSetDate
}MODE;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad{
  
  [super viewDidLoad];
  
  [self requestXmlFileFromDate:[NSDate date]];
  dateTextField.text = [CommonMethods getDate:[NSDate date]];
  numberPad = [[NumberPadView alloc]init];
  [self.view addSubview:numberPad];
  [CommonMethods hide:YES view:numberPad animate:NO];
  
  currency = [[CurrencyView alloc]initWithCurrency:nil];
  [self.view addSubview:currency];
  [CommonMethods hide:YES view:currency animate:NO];
  currency.currencyDelegate = self;
  
  valutePad = [[ValuteValuePad alloc]init];
  valutePad.center = CGPointMake(160, 100);
  [self.view addSubview:valutePad];
  valutePad.delegate = self;
  numberPad.delegate = valutePad;
  
  currCurrency1 = @"MD";
  currCurrency2 = @"MD";
  value1 = @"0";
  
  
  [CommonMethods hide:YES view:datePicker animate:NO];
  [CommonMethods hide:NO view:numberPad animate:YES];
}


#pragma mark-Delegates
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  
  [CommonMethods hide:NO view:datePicker animate:YES];
  
  return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  
  return YES;
}

- (void)didFinishParsing:(NSDictionary *)dictionary{
  if(currency->isFilled == NO)
  [currency setCurrency:dictionary];
  
  convertor = [[Convertor alloc]initWithCurencies:dictionary];
  NSLog(@"didFinishParsing");
}

- (void)ValuePadDidChangeValue:(NSString *)value{
  NSLog(@"ValuePadDidChangeValue %@",value);
  value1 = value;
  [self convert];
}

- (void)currencyViewDidChangeCurrency:(NSString*)currencyStr inComponent:(NSInteger)component{
    NSLog(@"currencyViewDidChangeCurrency %@",currencyStr);
  if(component){
    currCurrency2 = currencyStr;
    [valutePad.charCode2 setText:currCurrency2];
  }else{
    currCurrency1 = currencyStr;   
    [valutePad.charCode1 setText:currCurrency1];
  }
 [self convert];
}

- (void)convert{
  NSDecimalNumber* num  = [convertor convertValue:[NSDecimalNumber decimalNumberWithString:value1] 
                                      fromCurency:currCurrency1 
                                               to:currCurrency2];
  [valutePad.valute2 setText:[NSString stringWithFormat:@"%@",num]];
}

- (void)requestXmlFileFromDate:(NSDate*)date{
  parser = [[ParserXml alloc]init];
  NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://bnm.md/md/official_exchange_rates?get_xml=1&date=%@",    [CommonMethods getDate:date]]];
  parser.delegate =self;
  [parser parseXmlFromUrl:url];
}


- (IBAction)selectSegment:(id)sender{
  static int dateChanged;
  
  if(dateChanged){
    [self requestXmlFileFromDate:datePicker.date];
    dateTextField.text = [CommonMethods getDate:datePicker.date];
    dateChanged =NO;
    NSLog(@"DATECHANGED");
  }
  
  UISegmentedControl* segCtrl = (UISegmentedControl*)sender;
  switch (segCtrl.selectedSegmentIndex) {
    case kModeCalculator:
      [CommonMethods hide:NO view:numberPad animate:YES];
      [CommonMethods hide:YES view:datePicker animate:YES];
      [CommonMethods hide:YES view:currency animate:YES];
      break;
    case kModeCurrency:
      [CommonMethods hide:NO view:currency animate:YES]; 
      [CommonMethods hide:YES view:datePicker animate:YES];
      [CommonMethods hide:YES view:numberPad animate:YES];
      break;
    case kModeSetDate:
      [CommonMethods hide:YES view:numberPad animate:YES];
      [CommonMethods hide:YES view:currency animate:YES];
      [CommonMethods hide:NO view:datePicker animate:YES];
      dateChanged = YES;
      NSLog(@"SetDate");
      break;
  }
}

@end
