//
//  CurrencyPadView.h
//  MyExchanger
//
//  Created by Mirzac Andrei on 20.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrencyPadView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
{
  UIPickerView* pickerView;
}
@end
