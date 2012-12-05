//
//  MallDetailViewController.m
//  Totole
//
//  Created by disan disan on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MallDetailViewController.h"

@interface MallDetailViewController ()

@end


@implementation MallDetailViewController
@synthesize categoryId;

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
- (IBAction)popular_click:(id)sender 
{
    [top_imagView setImage:[UIImage imageNamed:@"mall_top1.png"]];
}
- (IBAction)new_click:(id)sender 
{
    [top_imagView setImage:[UIImage imageNamed:@"mall_top2.png"]];
}
- (IBAction)integral_click:(id)sender 
{
    [top_imagView setImage:[UIImage imageNamed:@"mall_top3.png"]];
}

- (void)viewDidUnload
{
    popular_btn = nil;
    new_btn = nil;
    integral_btn = nil;
    top_imagView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
