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

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

-(void)btn_click
{
    cook = YES;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.


    HomeViewController *homeVC = [[HomeViewController alloc]init];
    homeVC.tabBarItem.title = @"首页";
    homeVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_03.png"];    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:homeVC];
    nav1.navigationBarHidden = YES;
    
    ActivateViewController *activateVC = [[ActivateViewController alloc]init];
    activateVC.tabBarItem.title = @"激活";
    activateVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_05.png"];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:activateVC];

    
    MallViewController *mallVC = [[MallViewController alloc]init];
    mallVC.tabBarItem.title = @"商场";
    mallVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_07.png"]; 
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:mallVC];
    
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    activityVC.tabBarItem.title = @"活动";
    activityVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_09.png"]; 
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:activityVC];
    
    AnnouncementViewController *announceVC = [[AnnouncementViewController alloc]init];
    announceVC.tabBarItem.title = @"公告";
    announceVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_13.png"]; 
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:announceVC];
    
    ManagementCenterViewController *managementVC = [[ManagementCenterViewController alloc]init];
    managementVC.tabBarItem.title = @"管理中心";
    managementVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_15.png"]; 
    UINavigationController *nav6 = [[UINavigationController alloc]initWithRootViewController:managementVC];
    
    MyFavoritesViewController *myFavoritesVC = [[MyFavoritesViewController alloc]init];
    myFavoritesVC.tabBarItem.title = @"我的收藏";
    myFavoritesVC.tabBarItem.image = [UIImage imageNamed:@"00-首页_17.png"]; 
    UINavigationController *nav7 = [[UINavigationController alloc]initWithRootViewController:myFavoritesVC];
    
    
    UITabBarController *tabBarControl = [[UITabBarController alloc]init];
    tabBarControl.delegate = self;
    
   
    NSArray *controllers_array = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4,nav5,nav6,nav7, nil];
    NSArray *controll_array = [NSArray arrayWithObjects:nav1,nav3,nav4,nav5,nav6,nav7, nil];
    
    if (cook && cook == YES) 
    {
        tabBarControl.viewControllers = controllers_array;
    }
    else 
    {
        tabBarControl.viewControllers = controll_array;
    }
//    tabBarControl.tabBar.hidden = YES;
    
//    UINavigationController *navigationControl = [[UINavigationController alloc]initWithRootViewController:tabBarControl];
//    navigationControl.navigationBarHidden = YES;
    
//    RootViewController *rootVC = [[RootViewController alloc]init];
//    [self.window addSubview:tabBarControl.view];
    tabBarControl.navigationController.navigationBarHidden = YES;
    self.window.rootViewController = tabBarControl;
    
    [nav1 release];
    [nav2 release];
    [nav3 release];
    [nav4 release];
    [nav5 release];
    [nav6 release];
    [nav7 release];
    [homeVC release];
    [activateVC release];
    [mallVC release];
    [activityVC release];
    [announceVC release];
    [managementVC release];
    [myFavoritesVC release];
    
    [tabBarControl release];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
