//
//  testXmlParser.m
//  MyExchanger
//
//  Created by iMac on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <GHUnitIOS/GHUnit.h> 
#import "ParserXml.h"
#import "Convertor.h"
@interface  testXmlParser:GHTestCase<ParserDelegate>{
  
  ParserXml*parserXml;
}
@end


@implementation testXmlParser

- (BOOL)shouldRunOnMainThread
{
  // By default NO, but if you have a UI test or test dependent on running on the main thread return YES.
  // Also an async test that calls back on the main thread, you'll probably want to return YES.
  return NO;
}

- (void)setUpClass {
  // Run at start of all tests in the class
}

- (void)tearDownClass {
  // Run at end of all tests in the class
}

- (void)setUp {
  // Run before each test method
}

- (void)tearDown {
  // Run after each test method
}   

- (void)testFoo {       
  NSString *a = @"foo";
  GHTestLog(@"I can log to the GHUnit test console: %@", a);
  
  // Assert a is not NULL, with no custom error description
  GHAssertNotNil(a,nil);
  
  // Assert equal objects, add custom error description
  NSString *b = @"bar";
  GHAssertEqualObjects(a, b, @"A custom error message. a should be equal to: %@.", b);
}

- (void)testXMLParser{
  
  parserXml = [[ParserXml alloc]init];
  
  NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://bnm.md/md/official_exchange_rates?get_xml=1&date=%@",[self getDateNow]]];
  parserXml.delegate  = self;
  [parserXml parseXmlFromUrl:url];
  GHTestLog(@"Did Parse Xml");
}

-(void)didFinishParsing:(NSDictionary *)dictionary{
  NSLog(@"Did recieve Parsing Dictionary");
  [parserXml printCurrencies];
  Convertor * convertor =[[Convertor alloc]initWithCurencies:parserXml.currencies];
  NSArray* charcodes =  [convertor allCurencyCharCode];
  
  
  int i =0;
  for(NSString* str in charcodes){
    i+=123421;
    NSDecimalNumber *amount   = [[NSDecimalNumber alloc]initWithInt:i];
    NSDecimalNumber* number = [convertor convertValue:amount fromCurency:@"USD" to:@"RON"];
    NSLog(@":%d  :%@ from %@ to %@",i,number,@"USD",@"RON");
  }
}

-(void)testDateNow{
  GHTestLog(@"%@",[self getDateNow]);
}






@end