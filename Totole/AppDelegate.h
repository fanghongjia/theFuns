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
#import "ActivateViewController.h"
#import "MallViewController.h"
#import "ActivityViewController.h"
#import "AnnouncementViewController.h"
#import "ManagementCenterViewController.h"
#import "MyFavoritesViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    BOOL cook;
}

@property (strong, nonatomic) UIWindow *window;

-(void)initTabBarControl:(int)sender;

@end
