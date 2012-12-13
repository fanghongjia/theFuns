//
//  IntegralProductViewController.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "IntegralProductViewController.h"

@interface IntegralProductViewController ()

@end

@implementation IntegralProductViewController

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
    
    myScrollView.contentSize = CGSizeMake(320, 3500);
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

- (void)viewDidUnload {
    myScrollView = nil;
    [super viewDidUnload];
}
@end
