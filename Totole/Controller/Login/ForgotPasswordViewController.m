//
//  ForgotPasswordViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

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
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self 
                                                                                  action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    hotel = YES;

}
- (IBAction)hotelORcook_click:(id)sender 
{
    if (sender == hotel_btn) 
    {
        [hotel_btn setBackgroundImage:[UIImage imageNamed:@"login_selectIn.png"] forState:UIControlStateNormal];
        [cook_btn setBackgroundImage:[UIImage imageNamed:@"login_selectOut.png"] forState:UIControlStateNormal];
        hotel = YES;       
    }
    else 
    {
        [hotel_btn setBackgroundImage:[UIImage imageNamed:@"login_selectOut.png"] forState:UIControlStateNormal];
        [cook_btn setBackgroundImage:[UIImage imageNamed:@"login_selectIn.png"] forState:UIControlStateNormal];
        hotel = NO;
    }
}

- (IBAction)submit_click:(id)sender 
{
    //饭店注册
    if (hotel == YES) 
    {
        ;
    }
    else 
    {
        ;
    }
}

- (void) handleBackgroundTap:(UITapGestureRecognizer *)sender
{
    UIWindow* keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}

- (void)viewDidUnload
{
    hotel_btn = nil;
    cook_btn = nil;
    account_TF = nil;
    phoneNumber_TF = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)back_click:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
