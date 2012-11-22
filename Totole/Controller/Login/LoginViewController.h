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

@interface LoginViewController : UIViewController
{
    IBOutlet UITextField *account_TF;
    IBOutlet UITextField *password_TF;
    IBOutlet UIButton *hotel_btn;
    
    IBOutlet UIButton *cook_btn;
    IBOutlet UIButton *rememberPassword_btn;
    //标识是否选中饭店
    BOOL hotel,rememberPassword;
    
    NSMutableDictionary *accountInfo_mutableDic;
}

@end
