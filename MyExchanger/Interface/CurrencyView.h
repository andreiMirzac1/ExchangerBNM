//
//  CurrencyView.h
//  MyExchanger
//
//  Created by Mirzac Andrei on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CurrencyDelegate <NSObject>

- (void)currencyViewDidChangeCurrency:(NSString*)currency inComponent:(NSInteger)component;

@end
@interface CurrencyView : UIPickerView<UIPickerViewDelegate,UIPickerViewDataSource>{
  NSDictionary* currency;
  NSArray* keys;
  id<CurrencyDelegate>currencyDelegate;
@public
  int isFilled;
}


@property(nonatomic,strong)id<CurrencyDelegate>currencyDelegate;
@property(nonatomic,strong)  NSDictionary* currency;
- (id)initWithCurrency:(NSDictionary*)currency_;
@end
