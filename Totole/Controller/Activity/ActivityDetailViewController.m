//
//  ActivityDetailViewController.m
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import "ActivityDetailViewController.h"
#import "ActivityDetailCell.h"
#import "ShoppingSpreeViewController.h"

@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController

@synthesize str_activityId,str_activityType,str_issueNum;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)refreshData
{
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response)
                            {
                                NSDictionary *dic3 = response;
                                NSLog(@"dic3 == %@",dic3);
                                
                                tempArr = [[[dic3 objectForKey:@"output"]objectForKey:@"giftList"]JSONValue];
                                NSLog(@"getPreferentialGifts_activityId tempArr == %@",tempArr);
                                
                                recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
                                
                                
                                [self stopLoadingDown];
                                [self stopLoadingUp];
                                [mytableView reloadData];
                                
                                
                                
                            }loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getPreferentialGifts_activityId:self.str_activityId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSize:@"10"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    currentPage = 1;
    str_type = self.str_activityType;
    tempArr = [[NSMutableArray alloc]initWithCapacity:1];
    label_title.text = self.str_issueNum;
    
    bgScroll = [[BgScrollView alloc] initWithFrame:CGRectMake(0,135,320,265 + REFRESH_HEADER_HEIGHT) andType:1];
    bgScroll.delegate = self;  
    bgScroll.BgDelegate = self;
    bgScroll.contentSize = CGSizeMake(320, 265 + REFRESH_HEADER_HEIGHT + 1);
    [self.view addSubview:bgScroll];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 265) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    mytableView.separatorColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1];
//    mytableView.layer.cornerRadius = 10.0;
//    mytableView.layer.masksToBounds = YES;
    [bgScroll addSubview:mytableView];
    
    
    [self refreshData];
   
}
- (IBAction)activityList_click:(id)sender
{
    [topView setImage:[UIImage imageNamed:@"activity_list.png"]];
    mytableView.hidden = NO;
}
- (IBAction)avtivityRule_click:(id)sender
{
    [topView setImage:[UIImage imageNamed:@"activity_rule.png"]];
    mytableView.hidden = YES;
}

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row];
    ActivityDetailCell *cell = (ActivityDetailCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[ActivityDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];        
    }
    
    
    
    [[DataSource shareInstance] loadImageInThread:[[tempArr objectAtIndex:indexPath.row]objectForKey:@"avatar"] withView:cell.imageView];
    
    
    cell.lable_11.text = [[tempArr objectAtIndex:indexPath.row]objectForKey:@"giftName"];
    cell.lable_22.text = [NSString stringWithFormat:@"%@",[[tempArr objectAtIndex:indexPath.row]objectForKey:@"price"]];
    
    NSString *strtype = [NSString stringWithFormat:@"%@",str_type];
    if ([strtype isEqualToString:@"5"])
    {
         cell.lable_21.text = @"优惠积分:";
        
        NSString *str_preferentialPrice = [NSString stringWithFormat:@"%@",[[tempArr objectAtIndex:indexPath.row]objectForKey:@"preferentialPrice"]];
        
        cell.lable_31.text = [@"原积分:"stringByAppendingString:str_preferentialPrice];
        
        NSString *str_activityStock = [NSString stringWithFormat:@"%@",[[tempArr objectAtIndex:indexPath.row]objectForKey:@"activityStock"]];
        NSString *str = [[@"库存:"stringByAppendingString:str_activityStock]
                         stringByAppendingString:[[tempArr objectAtIndex:indexPath.row]objectForKey:@"unit"]];
        
        NSString *str_exchangeLimit = [NSString stringWithFormat:@"%@",[[tempArr objectAtIndex:indexPath.row]objectForKey:@"exchangeLimit"]];
        NSString *str2 =[[@"    兑换上限:"stringByAppendingString:str_exchangeLimit]
                         stringByAppendingString:@"个"];
        cell.lable_41.text = [str stringByAppendingString:str2];
    }
    
   
   
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_back.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShoppingSpreeViewController *shoppingSpreeVC = [[ShoppingSpreeViewController alloc]init];
    shoppingSpreeVC.str_itemId = [[tempArr objectAtIndex:indexPath.row]objectForKey:@"itemId"];
    [self.navigationController pushViewController:shoppingSpreeVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidUnload {
    topView = nil;
    label_title = nil;
    [super viewDidUnload];
}
@end
