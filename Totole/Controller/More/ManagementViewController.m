//
//  ManagementViewController.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "ManagementViewController.h"
#import "StationLettersViewController.h"

@interface ManagementViewController ()

@end

@implementation ManagementViewController

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
    myScrollView.contentSize = CGSizeMake(320, 460);
    
//    NSString *theText = @"Texting";
//    CGSize theStringSize = [theText sizeWithFont:[UIFont systemFontOfSize:16.0]
//                               constrainedToSize:theLabel.frame.size
//                                   lineBreakMode:theLabel.lineBreakMode];
//    
//    //Adjust the size of the UILable
//    theLable.frame = CGRectMake(theLable.frame.origin.x,
//                                theLable.frame.origin.y,
//                                theStringSize.width,
//                                theStringSize.height);
//    theLable.text = theText;
}
- (IBAction)stationLetters_click:(id)sender
{
    StationLettersViewController *stationLettersVC = [[StationLettersViewController alloc]init];
    [self.navigationController pushViewController:stationLettersVC animated:YES];
}
- (IBAction)myBox_click:(id)sender
{
    
}

- (IBAction)select_click:(UIButton *)sender
{
    
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
