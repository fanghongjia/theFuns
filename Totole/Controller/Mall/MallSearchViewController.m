    //
//  MallSearchViewController.m
//  Totole
//
//  Created by disan disan on 12-12-9.
//
//

#import "MallSearchViewController.h"
#import "MallCell.h"
#import "GiftDetailViewController.h"

@interface MallSearchViewController ()

@end

@implementation MallSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        bgScroll = [[BgScrollView alloc] initWithFrame:CGRectMake(0,122,320,290 + REFRESH_HEADER_HEIGHT) andType:1];
        bgScroll.delegate = self;
        bgScroll.BgDelegate = self;
        bgScroll.contentSize = CGSizeMake(320, 290 + REFRESH_HEADER_HEIGHT + 1);
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
        
        mytableView.hidden = YES;
        bgScroll.hidden = YES;
    }
    return self;
}

-(void)refreshData
{
    key_TF.text = str_keyword;
    NSLog(@"str_categoryId == %@",str_categoryId);
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"searchGift_keyword  dic3 == %@",dic3);
        
        [tempArr addObjectsFromArray:[[[dic3 objectForKey:@"output"] objectForKey:@"giftList"] JSONValue]];
        
        NSLog(@"tempArr == %@",tempArr);
        recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        
        [mytableView reloadData];
        [self stopLoadingDown];
        [self stopLoadingUp];

        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource searchGift_keyword:str_keyword categoryId:str_categoryId priceId:str_priceId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSize:@"10"];
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
    
    tempArr = [[NSMutableArray alloc]initWithCapacity:1];
    
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                  action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    allMutArray = [NSMutableArray arrayWithArray:[defaults objectForKey:@"categoryNameMut"]];
    allIDMutArray = [NSMutableArray arrayWithArray:[defaults objectForKey:@"categoryIdMut"]];
    
    valueMurArray = [[NSMutableArray alloc]initWithObjects:@"300以下",@"300-600",@"600-1000",@"1000-3000",@"3000-6000",@"6000以上", nil];
    valueIDMurArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    
    currentPage = 1;
    
    str_keyword = @"";
    str_categoryId = @"";
    str_priceId = @"";
}

- (void) handleBackgroundTap:(UITapGestureRecognizer *)sender
{
    UIWindow* keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}
- (IBAction)allProducts_click:(id)sender
{
    [self.view bringSubviewToFront:pickerView_1];
    [self.view bringSubviewToFront:My_toolbar];
    My_toolbar.hidden = NO;
    pickerView_1.hidden = NO;
    pickerView_2.hidden = YES;
}
- (IBAction)value_click:(id)sender
{
    [self.view bringSubviewToFront:pickerView_2];
    [self.view bringSubviewToFront:My_toolbar];
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

//搜索
- (IBAction)search_click:(id)sender
{
    mytableView.hidden = NO;
    bgScroll.hidden = NO;
    [tempArr removeAllObjects];
    [self refreshData];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//cell 个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tempArr.count;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row];
    MallCell *cell = (MallCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[MallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    NSString *url_string = [[tempArr objectAtIndex:row] objectForKey:@"avatar"];
    [[DataSource shareInstance] loadImageInThread:url_string withView:cell.imageView];
    
    cell.lable_1.text = [[tempArr objectAtIndex:row] objectForKey:@"name"];
    
    cell.lable_price.text = [NSString stringWithFormat:@"%@",[[tempArr objectAtIndex:row] objectForKey:@"price"]];
    
    cell.lable_unit.text = [@"积分/" stringByAppendingString:[[tempArr objectAtIndex:row] objectForKey:@"unit"]];
    
    NSString *stockAmount_str = [NSString stringWithFormat:@"%@",[[tempArr objectAtIndex:row] objectForKey:@"stockAmount"]];
    NSString *unit_str = [[tempArr objectAtIndex:row] objectForKey:@"unit"];
    cell.stockAmount_lb.text = [[@"库存" stringByAppendingString:stockAmount_str]stringByAppendingString:unit_str];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_back.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //title_str,brand_str,price_str,unit_str,stockAmoun_str;
    GiftDetailViewController *giftDetailVC = [[GiftDetailViewController alloc]init];
    NSString *mallId;
    
    mallId = [[tempArr objectAtIndex:indexPath.row]objectForKey:@"id"];
    giftDetailVC.mallId_str = mallId;
    [self.navigationController pushViewController:giftDetailVC animated:YES];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[bgScroll bgScrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[bgScroll bgScrollViewDidEndDragging];
}

#pragma mark -
#pragma mark BgScrollViewDelegate
- (void)stopLoadingDown
{
 	[bgScroll stopLoadingDown];
}

- (void)startLoadingDown
{
    
    //    if (ceil([recordCount_string intValue] / 10.0) > currentPage)
    //    {
    //        currentPage ++;
    //    }
	//上拉获取更多信息
    
    if (ceil([recordCount_string intValue] / 10.0) > currentPage)
    {
        currentPage ++;
        [self refreshData];
    }
    else
    {
        [self stopLoadingDown];
        [self stopLoadingUp];
    }
    
}

- (void)startLoadingUp
{
    //    currentPage = 1;
    // 下拉刷新
    
    //上拉获取更多信息
    
    [self refreshData];
}

- (void)stopLoadingUp
{
    [bgScroll stopLoadingUp];
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
