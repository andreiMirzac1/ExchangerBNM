//
//  NumberPadView.h
//  MyExchanger
//
//  Created by Mirzac Andrei on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumberPadDelegate <NSObject>
- (void)didPressButton:(NSString*)strChar;

@end
@interface NumberPadView : UIView
{
  id<NumberPadDelegate>delegate;
}
@property(nonatomic,strong)id<NumberPadDelegate>delegate;
@end
