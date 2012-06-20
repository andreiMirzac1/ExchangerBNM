//
//  MainViewController.h
//  MyExchanger
//
//  Created by iMac on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserXml.h"

@interface MainViewController : UIViewController<ParserDelegate>
{
  ParserXml * parser;
}

@end
