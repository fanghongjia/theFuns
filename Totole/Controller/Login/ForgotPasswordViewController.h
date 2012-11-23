//
//  ForgotPasswordViewController.h
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController
{
    __unsafe_unretained IBOutlet UITextField *account_TF;
    __unsafe_unretained IBOutlet UITextField *phoneNumber_TF;
    __unsafe_unretained IBOutlet UIButton *hotel_btn;
    __unsafe_unretained IBOutlet UIButton *cook_btn;
    BOOL hotel;
}

@end
