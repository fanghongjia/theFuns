//
//  MoreViewController.m
//  Totole
//
//  Created by disan disan on 12-11-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
#import "ConversionGuideViewController.h"
#import "IntegralProductViewController.h"
#import "AboutNTAViewController.h"
#import "NewbieViewController.h"
#import "ManagementViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

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
    
    self.navigationController.navigationBarHidden = YES;
}
- (IBAction)select_click:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        ManagementViewController *managementCenterVC = [[ManagementViewController alloc]init];
        [self.navigationController pushViewController:managementCenterVC animated:YES];
    }
    else if (sender.tag == 1)
    {
        AboutNTAViewController *aboutNTA = [[AboutNTAViewController alloc]init];
        [self.navigationController pushViewController:aboutNTA animated:YES];
    }
    else if (sender.tag == 2)
    {
        NewbieViewController *newbieVC = [[NewbieViewController alloc]init];
        [self.navigationController pushViewController:newbieVC animated:YES];
    }
    else if (sender.tag == 3)
    {
        ConversionGuideViewController *converVC = [[ConversionGuideViewController alloc]init];
        [self.navigationController pushViewController:converVC animated:YES];
    }
    else if (sender.tag == 4)
    {
        IntegralProductViewController *integralProductVC = [[IntegralProductViewController alloc]init];
        [self.navigationController pushViewController:integralProductVC animated:YES];
    }
    else//退出
    {
        ;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
