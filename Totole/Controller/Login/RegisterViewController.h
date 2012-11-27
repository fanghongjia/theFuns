//
//  RegisterViewController.h
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookPersonal_TableView.h"

@interface RegisterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UITableView *hotel_tableView;
    NSArray *hotel_array;
    
    __unsafe_unretained IBOutlet UIButton *hotelRegister_btn;
    __unsafe_unretained IBOutlet UIButton *cookRegister_btn;
    UITextField *myTF;
    BOOL agree;
    __unsafe_unretained IBOutlet UIPickerView *province_PickView;
    __unsafe_unretained IBOutlet UIToolbar *toolbar;
    __unsafe_unretained IBOutlet UIPickerView *city_PickView;
    __unsafe_unretained IBOutlet UIPickerView *hotelType_PickView;    
    __unsafe_unretained IBOutlet UIPickerView *post_PickView;
    NSMutableArray *province_Mutable,*city_Mutable,*hotelType_Mutable,*post_Mutable;
    
    UIButton *province_btn,*city_btn,*hotelType_btn,*post_btn;
    
    BOOL hotelRegister;
    
    CookPersonal_TableView *cookPersonal_TableView;
}

@end
