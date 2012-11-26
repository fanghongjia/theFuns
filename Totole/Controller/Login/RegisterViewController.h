//
//  RegisterViewController.h
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UITableView *hotel_tableView;
    NSArray *hotel_array;
    
    UITextField *myTF;
    BOOL agree;
    IBOutlet UIPickerView *province_PickView;
    IBOutlet UIToolbar *toolbar;
    
    NSMutableArray *province_Mutale;
    
    UIButton *province_btn,*city_btn;
}

@end
