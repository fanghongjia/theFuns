//
//  HomeViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabBarController.delegate = self;
}

- (void)viewDidUnload
{
    [activate_btn release];
    activate_btn = nil;
    [mall_btn release];
    mall_btn = nil;
    [activity_btn release];
    activity_btn = nil;
    [announcement_btn release];
    announcement_btn = nil;
    [management_btn release];
    management_btn = nil;
    [myFavorites_btn release];
    myFavorites_btn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)tabBarSelect_click:(id)sender 
{
    if (sender == activate_btn) 
    {
        self.tabBarController.selectedIndex = 1;
    }
    else if (sender == mall_btn)
    {
        self.tabBarController.selectedIndex = 2;
    }
    else if (sender == activity_btn)
    {
        self.tabBarController.selectedIndex = 3;
    }
    else if (sender == announcement_btn)
    {
        self.tabBarController.selectedIndex = 4;
//        [self.tabBarController.moreNavigationController pushViewController:self.tabBarController.selectedViewController animated:YES];
    }
    else if (sender == management_btn)
    {
        self.tabBarController.selectedIndex = 5;
    }
    else if (sender == myFavorites_btn)
    {   
        self.tabBarController.selectedIndex = 6;
    }
}


#pragma mark-
#pragma mark UITabBarcontrollerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers
{
    NSLog(@"willBeginCustomizingViewControllers: %@", viewControllers);
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    NSLog(@"viewcontrollers: %@, ischanged: %d", viewControllers, changed);
}


- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    NSLog(@"didEndCustomizingViewController!");
    NSLog(@"didEndCustomizingViewController: %@, ischanged: %d", viewControllers, changed);
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"didSelectViewController!");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [activate_btn release];
    [mall_btn release];
    [activity_btn release];
    [announcement_btn release];
    [management_btn release];
    [myFavorites_btn release];
    [super dealloc];
}
@end