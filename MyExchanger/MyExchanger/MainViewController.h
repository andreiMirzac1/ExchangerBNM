//
//  MainViewController.h
//  MyExchanger
//
//  Created by iMac on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRParserXml.h"
#import "NumberPadView.h"
#import "CurrencyView.h"
#import "ValuteValuePad.h"
#import "CRConvertor.h"

@interface MainViewController : UIViewController<ParserDelegate,CurrencyDelegate,ValuePadDelegate,UITextFieldDelegate>{
  ParserXml * parser;
  NumberPadView * numberPad ;
  CurrencyView * currency;
  ValuteValuePad * valutePad;
  Convertor * convertor;
  
  NSString* currCurrency1;
  NSString* currCurrency2;
  NSString* value1;
  
  IBOutlet UITextField * dateTextField;
  IBOutlet UIDatePicker * datePicker;
}

@end
