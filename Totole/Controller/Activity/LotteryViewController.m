//
//  LotteryViewController.m
//  Totole
//
//  Created by disan disan on 12-12-19.
//
//

#import "LotteryViewController.h"

@interface LotteryViewController ()

@end

@implementation LotteryViewController

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
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"getActivityDetail_itemId  dic3 == %@",dic3);
        NSDictionary *outputDic = [[NSDictionary alloc]init];
        outputDic = [dic3 objectForKey:@"output"];
        
        NSString *url_string = [outputDic objectForKey:@"picture"];
        //异步下载图片
        head_imagView.contentMode = UIViewContentModeScaleAspectFit;
        [[DataSource shareInstance] loadImageInThread:url_string withView:head_imagView];
        label_11.text = [outputDic objectForKey:@"giftName"];
        
        
        NSString *str_activityStock = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"activityStock"]];
        NSString *str = [@"参与用户数:"stringByAppendingString:str_activityStock];
        label_21.text = str;
        
        NSString *activityPrice_string = [outputDic objectForKey:@"activityPrice"];
        label_31.text = @"所需积分:" ;
        label_32.text = [NSString stringWithFormat:@"%@",activityPrice_string];
        
        
        label_41.text = [@"中奖名额:" stringByAppendingString:[outputDic objectForKey:@"participantsNo"]];
        
        NSString *HTMLStr = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"description"]];
        NSLog(@"HTMLStr == %@",HTMLStr);
        detail_textView.text = [DataSource getHTMLChangge:HTMLStr];
        
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getonlinDetail_itemId:self.str_itemId];
    
    myScrollView.contentSize = CGSizeMake(320, 548);
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

- (void)viewDidUnload {
    myScrollView = nil;
    head_imagView = nil;
    detail_textView = nil;
    label_11 = nil;
    label_21 = nil;
    label_31 = nil;
    label_32 = nil;
    label_41 = nil;
    [super viewDidUnload];
}

@end
