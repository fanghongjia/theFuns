//
//  HomeCookViewController.m
//  Totole
//
//  Created by disan disan on 12-11-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeCookViewController.h"

@interface HomeCookViewController ()

@end

@implementation HomeCookViewController

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
}
- (IBAction)tabBarCookSelect_click:(id)sender 
{
    if (sender == mall_btn)
    {
        self.tabBarController.selectedIndex = 1;
    }
    else if (sender == activity_btn)
    {
        self.tabBarController.selectedIndex = 2;
    }
    else if (sender == announcement_btn)
    {
        AnnouncementViewController *announceVC = [[AnnouncementViewController alloc]init];
        [self.navigationController pushViewController:announceVC animated:YES];
    }
    else if (sender == management_btn)
    {
        ManagementCenterViewController *managementVC = [[ManagementCenterViewController alloc]init];
        [self.navigationController pushViewController:managementVC animated:YES]; 
    }
    else if (sender == myFavorites_btn)
    {   
        MyFavoritesViewController *myFavoritesVC = [[MyFavoritesViewController alloc]init];
        [self.navigationController pushViewController:myFavoritesVC animated:YES];
    }
}


- (void)viewDidUnload
{
    mall_btn = nil;
    activity_btn = nil;
    announcement_btn = nil;
    management_btn = nil;
    myFavorites_btn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
