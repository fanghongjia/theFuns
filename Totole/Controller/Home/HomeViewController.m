//
//  HomeViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "ManagementViewController.h"
#import "GiftCollectionViewController.h"

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
    
    
    tempArr = [[NSMutableArray alloc]initWithCapacity:1];
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
    
        tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"pptImages"] JSONValue];
        NSLog(@"tempArr == %@",tempArr);
        
        [scroll setContentSize:CGSizeMake(self.view.frame.size.width*tempArr.count, scroll.frame.size.height)];
        scroll.alwaysBounceHorizontal = NO;
        [scroll setPagingEnabled:YES];
        scroll.delegate = self;
        [scroll setShowsHorizontalScrollIndicator:NO];
        
        for (int i=0; i<tempArr.count; i++)
        {
            CGRect vFrame = CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, scroll.frame.size.height);
            UIImageView *adView = [[UIImageView alloc]initWithFrame:vFrame];
            adView.contentMode = UIViewContentModeScaleAspectFit;
            [[DataSource shareInstance] loadImageInThread:[[tempArr objectAtIndex:i]objectForKey:@"pptImage"] withView:adView];
            [scroll addSubview:adView];
        }
        
        _pageControl = [[StyledPageControl alloc] initWithFrame:CGRectMake(6, 205, self.view.frame.size.width, 20)];
        [_pageControl setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [_pageControl setPageControlStyle:PageControlStyleThumb];
        [_pageControl setThumbImage:[UIImage imageNamed:@"pageControIcon_disable@2x.png"]];
        [_pageControl setSelectedThumbImage:[UIImage imageNamed:@"pageControIcon_enable@2x.png"]];
        [_pageControl setNumberOfPages:tempArr.count];
        [self.view addSubview:_pageControl];

    } loadInfo:@"正在加载..." HUDBackView:self.view];
    [daSource getPptImages];


}

#pragma mark -
#pragma mark scrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageNum = scrollView.contentOffset.x/self.view.frame.size.width;
    [_pageControl setCurrentPage:pageNum];
    
}

- (void)viewDidUnload
{
    activate_btn = nil;
    mall_btn = nil;
    activity_btn = nil;
    announcement_btn = nil;
    management_btn = nil;
    myFavorites_btn = nil;
    scroll = nil;
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
        AnnouncementViewController *announceVC = [[AnnouncementViewController alloc]init];
        [self.navigationController pushViewController:announceVC animated:YES];
    }
    else if (sender == management_btn)
    {
        ManagementViewController *managementVC = [[ManagementViewController alloc]init];
        [self.navigationController pushViewController:managementVC animated:YES]; 
    }
    else if (sender == myFavorites_btn)
    {   
        GiftCollectionViewController *myFavoritesVC = [[GiftCollectionViewController alloc]init];
        [self.navigationController pushViewController:myFavoritesVC animated:YES];
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

@end
