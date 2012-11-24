//
//  AppDelegate.m
//  Totole
//
//  Created by  on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

@synthesize window = _window;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSLog(@"- (BOOL)application:");


    LoginViewController *loginVC = [[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
    

    
    self.window.backgroundColor = [UIColor colorWithRed:254.0f/255.0f green:239.0f/255.0f blue:222.0f/255.0f alpha:1];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)initTabBarControl:(LoginType)type
{
    UITabBarController *tabBarControl = [[UITabBarController alloc]init];
    tabBarControl.delegate = self;
    
    
    

    MallViewController *mallVC = [[MallViewController alloc]init];
    mallVC.tabBarItem.title = @"商场";
    mallVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mall.png"]; 
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:mallVC];
    
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    activityVC.tabBarItem.title = @"活动";
    activityVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_activity.png"]; 
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:activityVC];
    
    AnnouncementViewController *announceVC = [[AnnouncementViewController alloc]init];
    announceVC.tabBarItem.title = @"公告";
    announceVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_announcement.png"]; 
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:announceVC];
    
    ManagementCenterViewController *managementVC = [[ManagementCenterViewController alloc]init];
    managementVC.tabBarItem.title = @"管理中心";
    managementVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_management.png"]; 
    UINavigationController *nav6 = [[UINavigationController alloc]initWithRootViewController:managementVC];
    
    MyFavoritesViewController *myFavoritesVC = [[MyFavoritesViewController alloc]init];
    myFavoritesVC.tabBarItem.title = @"我的收藏";
    myFavoritesVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_myfavorites.png"]; 
    UINavigationController *nav7 = [[UINavigationController alloc]initWithRootViewController:myFavoritesVC];
    if (type == LoginType_hotel) 
    {
        HomeViewController *homeVC = [[HomeViewController alloc]init];
        homeVC.tabBarItem.title = @"首页";
        homeVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home.png"];    
        UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:homeVC];
        nav1.navigationBarHidden = YES;
        
        ActivateViewController *activateVC = [[ActivateViewController alloc]init];
        activateVC.tabBarItem.title = @"激活";
        activateVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_activate.png"];
        UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:activateVC];
        
        NSArray *controllers_array = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4,nav5,nav6,nav7, nil];
        tabBarControl.viewControllers = controllers_array;
        
    }
    else 
    {
        
        HomeCookViewController *homeCookVC = [[HomeCookViewController alloc]init];
        homeCookVC.tabBarItem.title = @"首页";
        homeCookVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home.png"];    
        UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:homeCookVC];
        nav1.navigationBarHidden = YES;
        
        NSArray *controll_array = [NSArray arrayWithObjects:nav1,nav3,nav4,nav5,nav6,nav7, nil];
        tabBarControl.viewControllers = controll_array;
        
    }
    
    tabBarControl.navigationController.navigationBarHidden = YES;
    tabBarControl.moreNavigationController.navigationBarHidden = YES;
    self.window.rootViewController = tabBarControl;
    


    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"- (void)applicationWillResignActive:");
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"- (void)applicationDidEnterBackground:");
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"- (void)applicationWillEnterForeground:");    
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"- (void)applicationDidBecomeActive:");  
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"- (void)applicationWillTerminate:");
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
