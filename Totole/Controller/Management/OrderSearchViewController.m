//
//  OrderSearchViewController.m
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import "OrderSearchViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface OrderSearchViewController ()

@end

@implementation OrderSearchViewController

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
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                  action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
}

- (void) handleBackgroundTap:(UITapGestureRecognizer *)sender
{
    UIWindow* keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
