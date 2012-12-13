//
//  ConversionGuideViewController.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "ConversionGuideViewController.h"

@interface ConversionGuideViewController ()

@end

@implementation ConversionGuideViewController

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
    
//    [[DataSource shareInstance]loadImageInThread:@"http://61.172.246.10/site/resources/images/help/process.jpg" withView:guidImageView];
    
    url = [[NSURL alloc] initWithString :@"http://61.172.246.10/site/resources/images/help/process.jpg"];
    [ guidImageWebView loadRequest:[ NSURLRequest requestWithURL: url ]];
    
    activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    [activityIndicatorView setCenter: self.view.center] ;
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ;
    [self.view addSubview : activityIndicatorView] ;
}

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating] ;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    guidImageWebView = nil;
    [super viewDidUnload];
}
@end
