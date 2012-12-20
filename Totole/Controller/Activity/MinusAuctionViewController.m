//
//  MinusAuctionViewController.m
//  Totole
//
//  Created by disan disan on 12-12-20.
//
//

#import "MinusAuctionViewController.h"

@interface MinusAuctionViewController ()

@end

@implementation MinusAuctionViewController

@synthesize str_itemId;

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
    
    //getsubtractAuctionDetail_itemId
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"getAddAuctionDetail_itemId  dic3 == %@",dic3);
        NSDictionary *outputDic = [[NSDictionary alloc]init];
        outputDic = [dic3 objectForKey:@"output"];
        
        NSString *url_string = [outputDic objectForKey:@"picture"];
        //异步下载图片
        head_imagView.contentMode = UIViewContentModeScaleAspectFit;
        [[DataSource shareInstance] loadImageInThread:url_string withView:head_imagView];
        label_11.text = [outputDic objectForKey:@"giftName"];
        
        
        NSString *str_activityStock = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"activityStock"]];
        NSString *str_unit = [outputDic objectForKey:@"unit"];
        NSString *str = [[@"库存:"stringByAppendingString:str_activityStock] stringByAppendingString:str_unit];
        
        NSString *str_subtractPrice = [[NSString stringWithFormat:@"%@",[outputDic objectForKey:@"subtractPrice"]]stringByAppendingString:@"/"];
        
        NSString *str_timeInterval = [[NSString stringWithFormat:@"%@",[outputDic objectForKey:@"timeInterval"]]stringByAppendingString:@"小时"];
        NSString *str1 = [[@"  减价幅度:"stringByAppendingString:str_subtractPrice]stringByAppendingString:str_timeInterval];
        
        label_21.text = [str stringByAppendingString:str1];
        
        NSLog(@"auctionMembers == %@",[outputDic objectForKey:@"auctionMembers"]);
        
        
        label_32.text = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"currentPrice"]];
        //        NSArray *array_memberName =[[outputDic objectForKey:@"auctionMembers"]objectForKey:@"memberName" ];
        //
        //        if (![[[outputDic objectForKey:@"auctionMembers"]objectForKey:@"memberName" ] isEqual:nil])
        //        {
        //            label_33.text = [@"(   "stringByAppendingString:@"出价)"];
        //        }
        //        else
        //        {
        //            NSString *str_memberName= [[[outputDic objectForKey:@"auctionMembers"]objectAtIndex:0]objectForKey:@"memberName"];
        //            label_33.text = [[@"("stringByAppendingString:str_memberName]stringByAppendingString:@"出价)"];
        //        }
        
        
        
        NSString *str_startPrice = [outputDic objectForKey:@"startPrice"];
        label_41.text = [@"起拍价:" stringByAppendingString:str_startPrice];
        
        NSString *str_price = [outputDic objectForKey:@"price"];
        label_42.text = [@"商城价:" stringByAppendingString:str_price];
        
        
        NSString *HTMLStr = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"description"]];
        NSLog(@"HTMLStr == %@",HTMLStr);
        detail_textView.text = [DataSource getHTMLChangge:HTMLStr];
        
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getsubtractAuctionDetail_itemId:self.str_itemId];
    
    myScrollView.contentSize = CGSizeMake(320, 548+135);
}
- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addToFavorite_click:(id)sender
{
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"addToFavorite_click  dic3 == %@",dic3);
        
        if ([[[dic3 objectForKey:@"output"]objectForKey:@"resultCode"] isEqual:@"OK"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                           message:@"收藏成功!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([[[dic3 objectForKey:@"output"]objectForKey:@"errorMessage"] isEqual:@"unLogin"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                           message:@"请先登录!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                           message:@"收藏失败!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil, nil];
            [alert show];
        }
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource addToFavorite_giftId:self.str_itemId];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    myScrollView = nil;
    head_imagView = nil;
    detail_textView = nil;
    label_11 = nil;
    label_21 = nil;
    label_33 = nil;
    label_32 = nil;
    label_41 = nil;
    label_42 = nil;
    [super viewDidUnload];
}

@end
