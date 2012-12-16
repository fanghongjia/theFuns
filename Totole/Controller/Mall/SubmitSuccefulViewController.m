//
//  SubmitSuccefulViewController.m
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import "SubmitSuccefulViewController.h"
#import "MyOrderViewController.h"
#import "MallViewController.h"

@interface SubmitSuccefulViewController ()

@end

@implementation SubmitSuccefulViewController

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

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)myorder_click:(id)sender
{
    MyOrderViewController *myOrderVC = [[MyOrderViewController alloc]init];
    [self.navigationController pushViewController:myOrderVC animated:YES];
}
- (IBAction)goOnShop:(id)sender
{
//    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    MallViewController *mallVC = [[MallViewController alloc]init];
    [self.navigationController pushViewController:mallVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
