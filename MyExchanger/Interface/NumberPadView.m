//
//  NumberPadView.m
//  MyExchanger
//
//  Created by Mirzac Andrei on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberPadView.h"

@implementation NumberPadView
@synthesize delegate;

- (id)init
{
  NSArray * bundle = [[NSBundle mainBundle]loadNibNamed:@"NumberPadView" owner:self options:nil];
  for(id object in bundle){
    if([object isKindOfClass:[NumberPadView class]]){
      NumberPadView * currPad= (NumberPadView*)object;
      return currPad;
    }
  }
    return nil;
}

-(IBAction)didTouchButton:(id)sender{
  UIButton* button  = (UIButton*)sender;
  [self.delegate didPressButton:button.titleLabel.text];
}
@end
