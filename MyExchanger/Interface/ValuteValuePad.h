//
//  ValuteValuePad.h
//  MyExchanger
//
//  Created by Mirzac Andrei on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.


#import <UIKit/UIKit.h>
#import "NumberPadView.h"

@protocol ValuePadDelegate <NSObject>
- (void)ValuePadDidChangeValue:(NSString*)value;
@end

@interface ValuteValuePad: UIView<NumberPadDelegate>{
  id<ValuePadDelegate>delegate;
}
@property(nonatomic,strong)id<ValuePadDelegate>delegate;
@property(nonatomic,strong)IBOutlet UILabel*valute1;
@property(nonatomic,strong)IBOutlet UILabel*valute2;
@property(nonatomic,strong)IBOutlet UILabel*charCode2;
@property(nonatomic,strong)IBOutlet UILabel*charCode1;

- (BOOL)hasDot:(NSString*)str;
@end
