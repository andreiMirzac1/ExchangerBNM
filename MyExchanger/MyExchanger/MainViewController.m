//
//  MainViewController.m
//  MyExchanger
//
//  Created by iMac on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ParserXml.h"
#import "MainViewController.h"
#import "CurrencyPadView.h"
#import "NumberPadView.h"

typedef enum Mode{
kModeCalculator=0,
kModeCurrency
}MODE;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  
  //  NumberPadController* numPad  = [[NumberPadController alloc]init];
  //  numPad.view.center = CGPointMake(160, 360);
  //  [self.view addSubview:numPad.view];
  //  
  
  
  parser = [[ParserXml alloc]init];
  NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://bnm.md/md/official_exchange_rates?get_xml=1&date=%@",[CommonMethods getDateNow]]];
  parser.delegate =self;
  [parser parseXmlFromUrl:url];
}

- (void)didFinishParsing:(NSDictionary *)dictionary{
  
  NSArray * bundle = [[NSBundle mainBundle]loadNibNamed:@"NumberPadView" owner:self options:nil];
  for(id object in bundle){
    if([object isKindOfClass:[NumberPadView class]]){
      NumberPadView * currPad= (NumberPadView*)object;
      [self.view addSubview:currPad];
    }
  }
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (IBAction)selectSegment:(id)sender{
  UISegmentedControl* segCtrl = (UISegmentedControl*)sender;
  
  switch (segCtrl.selectedSegmentIndex) {
    case kModeCalculator:
      
      break;
    case kModeCurrency:
      
      break;
  }
}
@end
