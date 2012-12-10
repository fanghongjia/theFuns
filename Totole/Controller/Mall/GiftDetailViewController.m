//
//  GiftDetailViewController.m
//  Totole
//
//  Created by disan disan on 12-12-7.
//
//

#import "GiftDetailViewController.h"

@interface GiftDetailViewController ()

@end

@implementation GiftDetailViewController

@synthesize mallId_str,title_str,brand_str,price_str,unit_str,stockAmoun_str;

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
        
        
        NSString *url_string = [outputDic objectForKey:@"avatar"];
        //异步下载图片
        [[DataSource shareInstance] loadImageInThread:url_string withView:head_imagView];
        title_lb.text = [outputDic objectForKey:@"giftName"];
        

        brand_lb.text = [@"品牌" stringByAppendingString:[outputDic objectForKey:@"brand"]];
        
        price_lb.text = [outputDic objectForKey:@"price"];
        
        unit_lb.text = [@"积分/" stringByAppendingString: [outputDic objectForKey:@"unit"]];
        
        stockAmount_lb.text = [[@"库存:" stringByAppendingString:[outputDic objectForKey:@"stock"]] stringByAppendingString:[outputDic objectForKey:@"unit"]];

        NSString *HTMLStr = [NSString stringWithFormat:@"%@",[outputDic objectForKey:@"description"]];
        NSLog(@"HTMLStr == %@",HTMLStr);
        detail_textView.text = [DataSource getHTMLChangge:HTMLStr];
       
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource giftDetail_giftId:self.mallId_str];
    
    myScrollView.contentSize = CGSizeMake(320, 548);

    NSLog(@"mallId_str == %@",mallId_str);
}
- (IBAction)shoppingCart_click:(id)sender
{
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"GiftDetailViewController  dic3 == %@",dic3);
        NSDictionary *outputDic = [[NSDictionary alloc]init];
        outputDic = [dic3 objectForKey:@"output"];
        
        
                
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource addToCart_giftId:self.mallId_str];
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
