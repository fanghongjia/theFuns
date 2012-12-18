//
//  ShoppingSpreeViewController.m
//  Totole
//
//  Created by disan disan on 12-12-18.
//
//

#import "ShoppingSpreeViewController.h"

@interface ShoppingSpreeViewController ()

@end

@implementation ShoppingSpreeViewController

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
    
    tempArr = [[NSMutableArray alloc]initWithCapacity:1];
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"getActivityDetail_itemId  dic3 == %@",dic3);
        NSDictionary *outputDic = [[NSDictionary alloc]init];
        outputDic = [dic3 objectForKey:@"output"];
        

        
        
        NSString *url_string = [outputDic objectForKey:@"picture"];
        //异步下载图片
        head_imagView.contentMode = UIViewContentModeScaleAspectFit;
        [[DataSource shareInstance] loadImageInThread:url_string withView:head_imagView];
        title_lb.text = [outputDic objectForKey:@"giftName"];
        
        
        //        NSString *string_brand = [outputDic objectForKey:@"brand"];
        //        NSLog(@"string_ == %d",string_brand.length);
        if (![outputDic objectForKey:@"brand"])
        {
            brand_lb.text = @"";
        }
        else
        {
            brand_lb.text = [@"品牌:" stringByAppendingString:[outputDic objectForKey:@"brand"]];
        }
        
        NSString *str_activityStock = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"activityStock"]];
        NSString *str = [[@"库存:"stringByAppendingString:str_activityStock]
                         stringByAppendingString:[outputDic objectForKey:@"unit"]];
        
        NSString *str_exchangeLimit = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"exchangeLimit"]];
        NSString *str2 =[[@"    兑换上限:"stringByAppendingString:str_exchangeLimit]
                         stringByAppendingString:@"个"];
        brand_lb.text = [str stringByAppendingString:str2];
        
        
        price_lb.text = @"优惠积分";
        
        unit_string = [outputDic objectForKey:@"price"];
            
        unit_lb.text = unit_string;//[@"积分/" stringByAppendingString:unit_string ];
        
        stockAmount_lb.text = [@"原积分:" stringByAppendingString:[outputDic objectForKey:@"preferentialPrice"]] ;
        
        NSString *HTMLStr = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"description"]];
        NSLog(@"HTMLStr == %@",HTMLStr);
        detail_textView.text = [DataSource getHTMLChangge:HTMLStr];
        
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getActivityDetail_itemId:self.str_itemId];
    
    myScrollView.contentSize = CGSizeMake(320, 548);
}

//加入收藏
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
    head_imagView = nil;
    title_lb = nil;
    brand_lb = nil;
    price_lb = nil;
    unit_lb = nil;
    stockAmount_lb = nil;
    detail_textView = nil;
    myScrollView = nil;
    [super viewDidUnload];
}

@end
