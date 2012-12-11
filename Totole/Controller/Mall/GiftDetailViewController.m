//
//  GiftDetailViewController.m
//  Totole
//
//  Created by disan disan on 12-12-7.
//
//

#import "GiftDetailViewController.h"
#import "ShoppingCartViewController.h"

@interface GiftDetailViewController ()

@end

@implementation GiftDetailViewController

@synthesize mallId_str;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"GiftDetailViewController  dic3 == %@",dic3);
        NSDictionary *outputDic = [[NSDictionary alloc]init];
        outputDic = [dic3 objectForKey:@"output"];
        
        
        url_string = [outputDic objectForKey:@"avatar"];
        //异步下载图片
        [[DataSource shareInstance] loadImageInThread:url_string withView:head_imagView];
        title_lb.text = [outputDic objectForKey:@"giftName"];
        

        brand_lb.text = [@"品牌:" stringByAppendingString:[outputDic objectForKey:@"brand"]];
        
        price_lb.text = [outputDic objectForKey:@"price"];
        
        unit_string = [outputDic objectForKey:@"unit"];
        
        unit_lb.text = [@"积分/" stringByAppendingString:unit_string ];
        
        stockAmount_lb.text = [[@"库存:" stringByAppendingString:[outputDic objectForKey:@"stock"]] stringByAppendingString:unit_string];

        NSString *HTMLStr = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"description"]];
        NSLog(@"HTMLStr == %@",HTMLStr);
        detail_textView.text = [DataSource getHTMLChangge:HTMLStr];
       
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource giftDetail_giftId:self.mallId_str];
    
    myScrollView.contentSize = CGSizeMake(320, 548);

    NSLog(@"mallId_str == %@",mallId_str);
}
//加入购物车 (立即兑换)
- (IBAction)shoppingCart_click:(id)sender
{
    NSMutableDictionary *shopDic = [[NSMutableDictionary alloc]init];
    
    
    [shopDic setValue:self.mallId_str forKey:@"giftId"];
    NSLog(@"mallId_str == %@",self.mallId_str);
    NSLog(@"url_string == %@",url_string);
    [shopDic setValue:url_string forKey:@"avatar"];
    [shopDic setValue:title_lb.text forKey:@"giftName"];
    [shopDic setValue:price_lb.text forKey:@"price"];
    [shopDic setValue:unit_lb.text forKey:@"unit"];
    [shopDic setValue:@"1" forKey:@"number"];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    shoppingArr = [NSMutableArray arrayWithArray:[userDefault objectForKey:@"shoppingArr"]];
    if (!shoppingArr)
    {
        shoppingArr = [NSMutableArray arrayWithCapacity:1];
    }    
    [shoppingArr insertObject:shopDic atIndex:0];//把购物车需要的信息加入数组
    [userDefault setValue:shoppingArr forKey:@"shoppingArr"];
    [userDefault synchronize];
    
    ShoppingCartViewController *shoppingCartVC = [[ShoppingCartViewController alloc]init];
    [self.navigationController pushViewController:shoppingCartVC animated:YES];
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
