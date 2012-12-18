//
//  GiftCollectionViewController.m
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import "GiftCollectionViewController.h"
#import "GiftCollectionCell.h"
#import "GiftDetailViewController.h"


@interface GiftCollectionViewController ()

@end

@implementation GiftCollectionViewController


-(void)refreshData
{
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"myFavorites_pageNo  dic3 == %@",dic3);
        
        [self stopLoadingDown];
        [self stopLoadingUp];
        
        [tempArr addObjectsFromArray:[[[dic3 objectForKey:@"output"] objectForKey:@"myFavorites"] JSONValue]];
        
        NSLog(@"tempArr == %@",tempArr);
        recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        
        [mytableView reloadData];
        
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource myFavorites_pageNo:[NSString stringWithFormat:@"%d",currentPage] pageSize:@"10"];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tempArr = [[NSMutableArray alloc]initWithCapacity:1];
        
        bgScroll = [[BgScrollView alloc] initWithFrame:CGRectMake(0,46,320,365 + REFRESH_HEADER_HEIGHT) andType:1];
        bgScroll.delegate = self;
        bgScroll.BgDelegate = self;
        bgScroll.contentSize = CGSizeMake(320, 365 + REFRESH_HEADER_HEIGHT + 1);
        [self.view addSubview:bgScroll];
        
        mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 365) style:UITableViewStylePlain];
        mytableView.delegate = self;
        mytableView.dataSource = self;
        mytableView.backgroundColor = [UIColor clearColor];
        mytableView.showsVerticalScrollIndicator = NO;
        mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        mytableView.layer.cornerRadius = 10.0;
        mytableView.layer.masksToBounds = YES;
        [bgScroll addSubview:mytableView];
        
        [self refreshData];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //先取第一页
    currentPage = 1;
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
    GiftCollectionCell *cell = (GiftCollectionCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[GiftCollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    NSString *url_string = [[tempArr objectAtIndex:indexPath.row] objectForKey:@"giftAvatar"];
    [[DataSource shareInstance] loadImageInThread:url_string withView:cell.imageView];
    cell.lable_11.text = [[tempArr objectAtIndex:indexPath.row]objectForKey:@"giftName"];
    cell.lable_31.text = [[tempArr objectAtIndex:indexPath.row]objectForKey:@"price"];
    NSString *str = @"积分/";
    cell.lable_32.text = [str stringByAppendingString:[[tempArr objectAtIndex:indexPath.row]objectForKey:@"unit"]];
   
    cell.btn_delete.tag = indexPath.row;
    [cell.btn_delete addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_back.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //title_str,brand_str,price_str,unit_str,stockAmoun_str;
    GiftDetailViewController *giftDetailVC = [[GiftDetailViewController alloc]init];
    NSString *mallId;

    mallId = [[tempArr objectAtIndex:indexPath.row]objectForKey:@"giftId"];
    giftDetailVC.mallId_str = mallId;
    [self.navigationController pushViewController:giftDetailVC animated:YES];
}

//删除cell
-(void)delete:(UIButton *)sender
{
    
//    [tempArr removeObjectAtIndex:sender.tag];
//    
//    NSIndexPath *path = [NSIndexPath indexPathForRow:sender.tag inSection:0];
//    [mytableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationFade];
//    [mytableView reloadData];
    
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"deleteFavorite_collectId  dic3 == %@",dic3);
        
        if (!tempArr.count == 0)
        {
            [tempArr removeAllObjects];
        }
        else
        {
            
        }
       
       [self refreshData];
       
        
    } loadInfo:@"正在加载..." HUDBackView:nil];
    [daSource deleteFavorite_collectId:[[tempArr objectAtIndex:sender.tag] objectForKey:@"collectId"]];
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

@end
