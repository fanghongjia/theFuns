//
//  ActivityViewController.m
//  Totole
//
//  Created by  on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityCell.h"
#import "ActivityDetailViewController.h"

@implementation ActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)refreshData
{
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response)
                            {
                                
                                dataType = 0;
                                NSLog(@"Ongoing_currentPageOngoing_currentPage == %d",Ongoing_currentPage);
                                NSDictionary *dic3 = response;
                                NSLog(@"dic3 == %@",dic3);
                                [tempArr addObjectsFromArray:[[[dic3 objectForKey:@"output"]objectForKey:@"activityDTOList" ]JSONValue]];
                                NSLog(@"tempArr == %@",tempArr);
                                

                                OngoingActivity_str = [[dic3 objectForKey:@"output"]objectForKey:@"recordCount"];
                                
                                [myTableView reloadData];
                                [self stopLoadingDown];
                                [self stopLoadingUp];
                                
                            }loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getOngoingActivity_pageNo:[NSString stringWithFormat:@"%d",Ongoing_currentPage] pageSize:@"10"];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    
    tempArr = [[NSMutableArray alloc]init];
    OldActivityArr = [[NSMutableArray alloc]init];
    PublicActivityArr = [[NSMutableArray alloc]init];
    
    bgScroll = [[BgScrollView alloc]initWithFrame:CGRectMake(0, 84, 320, 332 + REFRESH_HEADER_HEIGHT) andType:1];
    bgScroll.delegate = self;
	bgScroll.BgDelegate = self;
	bgScroll.contentSize = CGSizeMake(320, 332 + REFRESH_HEADER_HEIGHT + 1);
	[self.view addSubview:bgScroll];

    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 332) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.showsVerticalScrollIndicator = NO;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    myTableView.separatorColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1];
    [bgScroll addSubview:myTableView];
       
    Ongoing_currentPage = 1;
    OldActivity_currentPage = 1;
    PublicActivity_currentPage = 1;
    
    [self refreshData];
  
}
- (IBAction)onGoing_click:(id)sender
{
    [topView setImage:[UIImage imageNamed:@"activity_top1.png"]];
    [self refreshData];
}
- (IBAction)notice_click:(id)sender
{
    [topView setImage:[UIImage imageNamed:@"activity_top2.png"]];
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response)
                            {
                                dataType = 1;
                                
                                NSDictionary *dic3 = response;
                                NSLog(@"dic3 == %@",dic3);
                                

                                [OldActivityArr addObjectsFromArray:[[[dic3 objectForKey:@"output"]objectForKey:@"activityDTOList" ]JSONValue]];
                                NSLog(@"tempArr == %@",OldActivityArr);
                                OldActivity_str = [[dic3 objectForKey:@"output"]objectForKey:@"recordCount"];
                                
                                NSLog(@"OldActivity_str == %@",OldActivity_str);
                                
                                [myTableView reloadData];
                                [self stopLoadingDown];
                                [self stopLoadingUp];

                            }loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getOldActivity_pageNo:[NSString stringWithFormat:@"%d",OldActivity_currentPage] pageSize:@"10"];
    
}
- (IBAction)befor_click:(id)sender
{
    [topView setImage:[UIImage imageNamed:@"activity_top3.png"]];
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response)
                            {
                                
                                dataType = 2;
                                
                                NSDictionary *dic3 = response;
                                NSLog(@"dic3 == %@",dic3);
                                [PublicActivityArr addObjectsFromArray:[[[dic3 objectForKey:@"output"]objectForKey:@"activityDTOList" ]JSONValue]];
                                NSLog(@"tempArr == %@",PublicActivityArr);
                                PublicActivity_str = [[dic3 objectForKey:@"output"]objectForKey:@"recordCount"];
                                
                                
                                [myTableView reloadData];
                                [self stopLoadingDown];
                                [self stopLoadingUp];

                            }loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource getPublicActivity_pageNo:[NSString stringWithFormat:@"%d",PublicActivity_currentPage] pageSize:@"10"];
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
    switch (dataType) {
        case 0:
            return tempArr.count;
            break;
        case 1:
            return OldActivityArr.count;
            break;
        case 2:
            return PublicActivityArr.count;
            break;
        default:
            break;
    }
    return tempArr.count;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row]; // @"TableSampleIdentifier" ;
    
    ActivityCell *cell = (ActivityCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
//    NSUInteger row = [indexPath row];
    
    if (cell == nil)
    {
        cell = [[ActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    if (dataType == 0)
    {
        NSString *url_string = [[tempArr objectAtIndex:indexPath.row] objectForKey:@"image"];
        [[DataSource shareInstance] loadImageInThread:url_string withView:cell.imageView];

    }
    else if (dataType == 1)
    {
        NSString *url_string = [[OldActivityArr objectAtIndex:indexPath.row] objectForKey:@"image"];
        [[DataSource shareInstance] loadImageInThread:url_string withView:cell.imageView];
    }
    else if (dataType == 2)
    {
        NSString *url_string = [[PublicActivityArr objectAtIndex:indexPath.row] objectForKey:@"image"];
        [[DataSource shareInstance] loadImageInThread:url_string withView:cell.imageView];
    }
    
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_back.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (dataType == 0)
    {
        ActivityDetailViewController *activityDetailVC = [[ActivityDetailViewController alloc]init];
        [self.navigationController pushViewController:activityDetailVC animated:YES];
    }
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
	switch (dataType)
    {
        case 0:
            if (ceil([OngoingActivity_str intValue] / 10.0) > Ongoing_currentPage)
            {
                Ongoing_currentPage ++;
                [self refreshData];
            }
            else
            {
                [self stopLoadingDown];
                [self stopLoadingUp];
            }
            break;
        case 1:
            if (ceil([OldActivity_str intValue] / 10.0) > OldActivity_currentPage)
            {
                OldActivity_currentPage ++;
                [self notice_click:nil];     // 热门
            }
            else
            {
                [self stopLoadingDown];
                [self stopLoadingUp];
            }
            break;
        case 2:
            if (ceil([PublicActivity_str intValue] / 10.0) > PublicActivity_currentPage)
            {
                PublicActivity_currentPage ++;
                [self befor_click:nil];         // 最新
            }
            else
            {
                [self stopLoadingDown];
                [self stopLoadingUp];
            }
            break;
        default:
            break;
    }
}

- (void)startLoadingUp
{
    //    currentPage = 1;
    // 下拉刷新
    
    //上拉获取更多信息
	switch (dataType)
    {
        case 0:
            [self refreshData];   // 正在进行
            break;
        case 1:
            [self notice_click:nil];     // 预告
            break;
        case 2:
            [self befor_click:nil];      // 往期
            break;
        default:
            break;
    }
}

- (void)stopLoadingUp
{
    [bgScroll stopLoadingUp];
}



- (void)viewDidUnload
{
    topView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
