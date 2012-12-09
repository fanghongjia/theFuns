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
//        title_lb.text = self.title_str;
//        brand_lb.text = self.brand_str;
//        price_lb.text = self.price_str;
//        unit_lb.text = self.unit_str;
//        stockAmount_lb.text = self.stockAmoun_str;
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource giftDetail_giftId:self.mallId_str];
    
    myScrollView.contentSize = CGSizeMake(320, 548);
    // Do any additional setup after loading the view from its nib.
//    title_lb.text = self.title_str;
//    brand_lb.text = self.brand_str;
//    price_lb.text = self.price_str;
//    unit_lb.text = self.unit_str;
//    stockAmount_lb.text = self.stockAmoun_str;
    
    NSLog(@"mallId_str == %@",mallId_str);
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
