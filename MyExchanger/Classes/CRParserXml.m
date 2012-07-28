//
//  ParserXml.m
//  MyExchanger
//
//  Created by iMac on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CRParserXml.h"

@implementation ParserXml
@synthesize delegate;
@synthesize currencies;

- (void)parseXmlFromUrl:(NSURL*)url{
  
  NSURLRequest * request  = [NSURLRequest requestWithURL:url];
  
  [NSURLConnection sendAsynchronousRequest:request 
                                     queue:[[NSOperationQueue alloc]init] 
                         completionHandler:^(NSURLResponse* response,NSData* data,NSError * error)
   {
   xmlParser = [[TBXML alloc]initWithXMLData:data error:&error];
   TBXMLElement * valuteElement = xmlParser.rootXMLElement->firstChild;
   currencies = [[NSMutableDictionary alloc]init];
   
   while(valuteElement){
     NSString* charCode  = [self descriptionforChildElementNamed:@"CharCode" parentElement:valuteElement];
     NSDictionary* dictionary   = [self createDictionaryFrom:valuteElement];
     
     [currencies setObject:dictionary forKey:charCode];
     
     valuteElement=valuteElement->nextSibling;
   }
  NSDictionary* mdDict =  [[NSDictionary alloc]
                           initWithObjectsAndKeys:@"MD",@"CharCode",@"1",@"Nominal",@"1",@"Value",@"Leu",@"Name",nil];
    [currencies setObject:mdDict forKey:@"MD"];
     
   NSLog(@"call delegate method");
   dispatch_sync(dispatch_get_main_queue(), ^{
   [self.delegate didFinishParsing:currencies];  
   });
   
   }];
}

- (NSString*)descriptionforChildElementNamed:(NSString*)elementName parentElement:(TBXMLElement*)parentElement{
  TBXMLElement* childElement =  [TBXML childElementNamed:elementName parentElement:parentElement];
  return [TBXML textForElement:childElement];
}

- (NSDictionary*)createDictionaryFrom:(TBXMLElement*)element{
  NSString* charCode  = [self descriptionforChildElementNamed:@"CharCode" parentElement:element];
  NSString* nominal  =[self descriptionforChildElementNamed:@"Nominal" parentElement:element];
  NSString* value  = [self descriptionforChildElementNamed:@"Value" parentElement:element];
  NSString* name  =  [self descriptionforChildElementNamed:@"Name" parentElement:element];
  
  return [[NSDictionary alloc]initWithObjectsAndKeys:charCode,@"CharCode",nominal,@"Nominal",value,@"Value",name,@"Name",nil];
}


- (void)printCurrencies{
  for(id key in currencies){
    NSDictionary* DICT = [currencies objectForKey:key];
    NSLog(@"%@",[DICT objectForKey:@"Value"]);
    NSLog(@"%@",[DICT objectForKey:@"Nominal"]);
    NSLog(@"%@",[DICT objectForKey:@"CharCode"]);
    NSLog(@"%@\n\n",[DICT objectForKey:@"Name"]);
  }
}


- (void) traverseElement:(TBXMLElement *)element {
  do {
    // Display the name of the element
    NSLog(@"Element Name %@",[TBXML elementName:element]);
    
    // Obtain first attribute from element
    TBXMLAttribute * attribute = element->firstAttribute;
    
    // if attribute is valid
    while (attribute) {
      // Display name and value of attribute to the log window
      NSLog(@"%@->%@ = %@",  [TBXML elementName:element],
            [TBXML attributeName:attribute],
            [TBXML attributeValue:attribute]);
      
      // Obtain the next attribute
      attribute = attribute->next;
    }
    // if the element has child elements, process them
    if (element->firstChild) 
      [self traverseElement:element->firstChild];
    
    // Obtain next sibling element
  } while ((element = element->nextSibling));  
}

@end
