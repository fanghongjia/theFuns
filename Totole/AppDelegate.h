//
//  AppDelegate.h
//  Totole
//
//  Created by  on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LoginViewController.h"

#import "HomeViewController.h"
#import "HomeCookViewController.h"

#import "ActivateViewController.h"
#import "MallViewController.h"
#import "ActivityViewController.h"

#import "MoreViewController.h"



typedef enum 
{
    LoginType_hotel,
    LoginType_cook
}LoginType;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    BOOL cook;
}

@property (strong, nonatomic) UIWindow *window;

-(void)initTabBarControl:(LoginType)sender;

@end
