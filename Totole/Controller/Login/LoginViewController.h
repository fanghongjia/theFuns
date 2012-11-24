//
//  LoginViewController.h
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "ForgotPasswordViewController.h"



@interface LoginViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITextField *account_TF;
    IBOutlet UITextField *password_TF;
    IBOutlet UIButton *hotel_btn;
    
    IBOutlet UIButton *cook_btn;
    IBOutlet UIButton *rememberPassword_btn;
    __unsafe_unretained IBOutlet UIToolbar *toolbar;
    __unsafe_unretained IBOutlet UIPickerView *myPickerView;
    //标识是否选中饭店
    BOOL hotel,rememberPassword,Equal;
    
    NSMutableDictionary *accountInfo_mutableDic;
    NSMutableArray *save_mutableArray;
    NSArray *accountTitle_array;
}

@end
