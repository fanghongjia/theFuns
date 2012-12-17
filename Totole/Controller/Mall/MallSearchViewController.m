    //
//  MallSearchViewController.m
//  Totole
//
//  Created by disan disan on 12-12-9.
//
//

#import "MallSearchViewController.h"

@interface MallSearchViewController ()

@end

@implementation MallSearchViewController

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
    
    
//    <select id="" name="">
//    <option value="-1">积分值</option>
//    <option value="1">300以下</option>
//    <option value="2">300-600</option>
//    <option value="3">600-1000</option>
//    <option value="4">1000-3000</option>
//    <option value="5">3000-6000</option>
//    <option value="6">6000以上</option>
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                  action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    bgScroll = [[BgScrollView alloc] initWithFrame:CGRectMake(0,122,320,290 + REFRESH_HEADER_HEIGHT) andType:1];
    bgScroll.delegate = self;
    bgScroll.BgDelegate = self;
    bgScroll.contentSize = CGSizeMake(320, 365 + REFRESH_HEADER_HEIGHT + 1);
    [self.view addSubview:bgScroll];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 290) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mytableView.layer.cornerRadius = 10.0;
    mytableView.layer.masksToBounds = YES;
    [bgScroll addSubview:mytableView];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    allMutArray = [NSMutableArray arrayWithArray:[defaults objectForKey:@"categoryNameMut"]];
    allIDMutArray = [NSMutableArray arrayWithArray:[defaults objectForKey:@"categoryIdMut"]];
    
    valueMurArray = [[NSMutableArray alloc]initWithObjects:@"300以下",@"300-600",@"600-1000",@"1000-3000",@"3000-6000",@"6000以上", nil];
    valueIDMurArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    
    currentPage = 1;
}

- (void) handleBackgroundTap:(UITapGestureRecognizer *)sender
{
    UIWindow* keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}
- (IBAction)allProducts_click:(id)sender
{
    My_toolbar.hidden = NO;
    pickerView_1.hidden = NO;
    pickerView_2.hidden = YES;
}
- (IBAction)value_click:(id)sender
{
    My_toolbar.hidden = NO;
    pickerView_1.hidden = YES;
    pickerView_2.hidden = NO;
}
- (IBAction)hidden_click:(id)sender
{

    if (pickerView_1.hidden == NO)
    {
        int selectedRow = [pickerView_1  selectedRowInComponent:0];
        NSLog(@"selectedRow==%d",selectedRow);
        cateStr = [allMutArray objectAtIndex:selectedRow];
        str_categoryId = [allIDMutArray objectAtIndex:selectedRow];
        NSLog(@"str_categoryId == %@",str_categoryId);
    }
    else if (pickerView_2.hidden == NO)
    {
       int selectedRow = [pickerView_2  selectedRowInComponent:0];
        priceStr = [valueMurArray objectAtIndex:selectedRow];
        str_priceId = [valueIDMurArray objectAtIndex:selectedRow];
        NSLog(@"str_priceId == %@",str_priceId);
    }
    
    My_toolbar.hidden = YES;
    pickerView_1.hidden = YES;
    pickerView_2.hidden = YES;
}
- (IBAction)search_click:(id)sender
{
    key_TF.text = str_keyword;
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"searchGift_keyword  dic3 == %@",dic3);
        
        
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource searchGift_keyword:str_keyword categoryId:str_categoryId priceId:str_priceId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSize:@"10"];
}

#pragma mark -
#pragma mark Picker DataSource Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView == pickerView_1)
    {
        return allMutArray.count;
    }
    else
    {
        return valueMurArray.count;
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView == pickerView_1)
    {
        return [allMutArray objectAtIndex:row];
    }
    else
    {
        return [valueMurArray objectAtIndex:row];
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
    pickerView_1 = nil;
    My_toolbar = nil;
    pickerView_2 = nil;
    key_TF = nil;
    [super viewDidUnload];
}
@end
