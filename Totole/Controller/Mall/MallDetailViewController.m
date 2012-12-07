//
//  MallDetailViewController.m
//  Totole
//
//  Created by disan disan on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MallDetailViewController.h"
#import "MallCell.h"

@implementation MallDetailViewController
@synthesize categoryId,title_str;

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

        [tempArr addObjectsFromArray:[[[dic3 objectForKey:@"output"] objectForKey:@"giftList"] JSONValue]];
        recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        NSLog(@"recordCount_string == %@",recordCount_string);
        
        for (int i = 0; i<tempArr.count; i++)
        {
            NSString *mallId_string = [[tempArr objectAtIndex:i] objectForKey:@"id"];
            
            [mallIdMut addObject:mallId_string];
        }
        NSLog(@"Category mallIdMut  == %@",mallIdMut);
        NSLog(@"Category tempArr == %@",tempArr);
         
        [mytableView reloadData];
         [self stopLoadingDown];
         [self stopLoadingUp];
         
    }loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getGiftByCategory:self.categoryId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSise:@"10"];
}

- (void)viewDidLoad
{
    currentPage = 1;
    // Do any additional setup after loading the view from its nib.
    dataType = 0;
    
    NSLog(@"self.categoryId == %@",self.categoryId);
    
    title_lb.text = self.title_str;
    
    bgScroll = [[BgScrollView alloc] initWithFrame:CGRectMake(0,86,320,330 + REFRESH_HEADER_HEIGHT) andType:1];
	bgScroll.delegate = self;
	bgScroll.BgDelegate = self;
	bgScroll.contentSize = CGSizeMake(320, 330 + REFRESH_HEADER_HEIGHT + 1);
	[self.view addSubview:bgScroll];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 330) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [bgScroll addSubview:mytableView];
    
    tempArr = [[NSMutableArray alloc]initWithCapacity:1];
    mallIdMut = [[NSMutableArray alloc]init];
    
    [self refreshData];

    [super viewDidLoad];
}

//热门列表
- (IBAction)popular_click:(id)sender
{
    dataType = 1;
    
    [top_imagView setImage:[UIImage imageNamed:@"mall_top1.png"]];
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        
        [self stopLoadingDown];
        [self stopLoadingUp];
        
        NSDictionary *dic3 = response;
        

     
        if (tempArr)
        {
            [tempArr removeAllObjects];
        }
        
        //获取到的数据
        
        [tempArr addObjectsFromArray:[[[dic3 objectForKey:@"output"] objectForKey:@"giftList"] JSONValue]];
        recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        NSLog(@"recordCount_string == %@",recordCount_string);
        
        //商品的id放到 mallIdMut 里
        if (mallIdMut)
        {
            [mallIdMut removeAllObjects];
        }
        
        for (int i = 0; i<tempArr.count; i++)
        {
            NSString *mallId_string = [[tempArr objectAtIndex:i] objectForKey:@"id"];
            
            [mallIdMut addObject:mallId_string];
        }
        NSLog(@"Hot mallIdMut  == %@",mallIdMut);
        NSLog(@"Hot tempArr == %@",tempArr);
        
        [mytableView reloadData];
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getGiftsOrderHot:self.categoryId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSise:@"10"];
    
    
    
    
}
//最新列表
- (IBAction)new_click:(id)sender 
{
    dataType = 2;
    
    [top_imagView setImage:[UIImage imageNamed:@"mall_top2.png"]];
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        
        [self stopLoadingDown];
        [self stopLoadingUp];
        
        if (tempArr)
        {
            [tempArr removeAllObjects];
        }
        tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"giftList"] JSONValue];
        
       recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        NSLog(@"recordCount_string == %@",recordCount_string);
        
        
        if (mallIdMut)
        {
            [mallIdMut removeAllObjects];
        }
        
        for (int i = 0; i<tempArr.count; i++)
        {
            NSString *mallId_string = [[tempArr objectAtIndex:i] objectForKey:@"id"];
            
            [mallIdMut addObject:mallId_string];
        }
        NSLog(@"Time mallIdMut  == %@",mallIdMut);
        NSLog(@"Time tempArr == %@",tempArr);
        
        [mytableView reloadData];
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getGiftsOrderTime:self.categoryId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSise:@"10"];
}

//积分列表
- (IBAction)integral_click:(id)sender 
{
    dataType = 3;
    
    [top_imagView setImage:[UIImage imageNamed:@"mall_top3.png"]];
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;

        [self stopLoadingDown];
        [self stopLoadingUp];
        
        if (tempArr)
        {
            [tempArr removeAllObjects];
        }
        tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"giftList"] JSONValue];
        
        recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        NSLog(@"recordCount_string == %@",recordCount_string);
        
        
        if (mallIdMut)
        {
            [mallIdMut removeAllObjects];
        }
        
        for (int i = 0; i<tempArr.count; i++)
        {
            NSString *mallId_string = [[tempArr objectAtIndex:i] objectForKey:@"id"];
            
            [mallIdMut addObject:mallId_string];
        }
        
        NSLog(@"Price mallIdMut  == %@",mallIdMut);
        NSLog(@"Price tempArr == %@",tempArr);
        
        [mytableView reloadData];
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getGiftsOrderPrice:self.categoryId pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSise:@"10"];
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
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row]; // @"TableSampleIdentifier" ;
    
    MallCell *cell = (MallCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    NSUInteger row = [indexPath row];

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
    
    if (ceil([recordCount_string intValue] / 10.0) > currentPage)
    {
        currentPage ++;
    }
	//上拉获取更多信息
	switch (dataType)
    {
        case 0:
            [self refreshData];
            break;
        case 1:
            [self popular_click:nil];     // 热门
            break;
        case 2:
            [self new_click:nil];         // 最新
            break;
        case 3:
            [self integral_click:nil];    // 积分
            break;
        default:
            break;
    }
}

- (void)startLoadingUp
{
    currentPage = 1;
    // 下拉刷新
    
    //上拉获取更多信息
	switch (dataType)
    {
        case 0:
            [self refreshData];
            break;
        case 1:
            [self popular_click:nil];     // 热门
            break;
        case 2:
            [self new_click:nil];     // 最新
            break;
        case 3:
            [self integral_click:nil];     // 积分
            break;
        default:
            break;
    }
}

- (void)stopLoadingUp
{
    [bgScroll stopLoadingUp];
}

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidUnload
{
    popular_btn = nil;
    new_btn = nil;
    integral_btn = nil;
    top_imagView = nil;
    title_lb = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
