//
//  ManagementViewController.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "ManagementViewController.h"
#import "StationLettersViewController.h"
#import "MyBoxViewController.h"
#import "AccountHistoryViewController.h"
#import "ChangePasswordViewController.h"
#import "MyOrderViewController.h"
#import "ShoppingCartViewController.h"
#import "GiftCollectionViewController.h"
#import "InviteFriendsViewController.h"

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
    MyBoxViewController *myboxVC = [[MyBoxViewController alloc]init];
    [self.navigationController pushViewController:myboxVC animated:YES];
}

- (IBAction)select_click:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        ;
    }
    //账户历史
    else if (sender.tag == 1)
    {
        AccountHistoryViewController *accountHistoryVC = [[AccountHistoryViewController alloc]init];
        [self.navigationController pushViewController:accountHistoryVC animated:YES];
    }
    else if (sender.tag == 2)
    {
        MyOrderViewController *myOrderVC = [[MyOrderViewController alloc]init];
        [self.navigationController pushViewController:myOrderVC animated:YES];
    }
    else if (sender.tag == 3)
    {
        ShoppingCartViewController *shoppingVC = [[ShoppingCartViewController alloc]init];
        [self.navigationController pushViewController:shoppingVC animated:YES];
    }
    else if (sender.tag == 4)
    {
        GiftCollectionViewController *giftCollectionVC = [[GiftCollectionViewController alloc]init];
        [self.navigationController pushViewController:giftCollectionVC animated:YES];
    }
    else if (sender.tag == 5)
    {
        ChangePasswordViewController *changePassVC = [[ChangePasswordViewController alloc]init];
        [self.navigationController pushViewController:changePassVC animated:YES];
    }
    else
    {
        InviteFriendsViewController *inviteFriendsVC = [[InviteFriendsViewController alloc]init];
        [self.navigationController pushViewController:inviteFriendsVC animated:YES];
    }
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
