//
//  ParserXml.h
//  MyExchanger
//
//  Created by iMac on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@protocol  ParserDelegate <NSObject>
- (void)didFinishParsing:(NSDictionary*)dictionary;
@end

@interface ParserXml : NSObject{
  TBXML* xmlParser;
  NSMutableDictionary* currencies;
  id<ParserDelegate>delegate;
}

@property(nonatomic,strong)NSMutableDictionary* currencies;
@property(nonatomic,strong)id<ParserDelegate>delegate;
- (void)parseXmlFromUrl:(NSURL*)url;
- (void)printCurrencies;
@end
