//
//  MallViewController.m
//  Totole
//
//  Created by  on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MallViewController.h"

@implementation MallViewController

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 46, 320, 370) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:mytableView];

    
    self.navigationController.navigationBarHidden = YES;
    tempArr = [[NSArray alloc]init];
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"categorys"] JSONValue];
        NSLog(@"dic_categorys == %@",tempArr);
        
        
//        NSArray *tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"resTypes"] JSONValue];
//        hotelType_Mutable = [NSArray arrayWithArray:tempArr];
//        NSLog(@"hotelType_Mutable  === %@",hotelType_Mutable);
//        for (int i=0; i<[tempArr count]; i++) 
//        {
//            NSLog(@"resTypeId[%i]====%@",i,[[tempArr objectAtIndex:i] objectForKey:@"resTypeId"]);
//            NSLog(@"resTypeName[%i]====%@",i,[[tempArr objectAtIndex:i] objectForKey:@"resTypeName"]);
//        }
        [mytableView reloadData];
    } loadInfo:@"正在加载..." HUDBackView:self.view];
    [daSource getGiftCategorys];
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
//    return reader_MutableArr.count;
    return tempArr.count;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil) 
    {
    }
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    
    //  head_imgeView = [MmUtil loadUserHeadface:[NSString stringWithFormat:@"%@%@",url_string,infoimg]];
    
    for (int i = 0; i < tempArr.count; i++) 
    {
        if (indexPath.row == i) 
        {
            NSString *categoryId_string = [[tempArr objectAtIndex:i] objectForKey:@"categoryId"];
            categoryIdMut = [[NSMutableArray alloc]init];
    
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 3, 33, 33)];
            NSString *url_string = [[tempArr objectAtIndex:i] objectForKey:@"image"];
            imageView = [MmUtil loadUserHeadface:url_string];
            [cell addSubview:imageView];
            
            UILabel *lable_1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 3, 120, 35)];
            lable_1.backgroundColor = [UIColor clearColor];
            lable_1.text = [[tempArr objectAtIndex:i] objectForKey:@"categoryName"];
            lable_1.font = [UIFont systemFontOfSize:15.0];
            [cell addSubview:lable_1];
            
        }
    }
    
    UIImageView *click_imagView = [[UIImageView alloc]initWithFrame:CGRectMake(290,13,9,14)];
    [click_imagView setImage:[UIImage imageNamed:@"mall_click.png"]];
    [cell.contentView addSubview:click_imagView];
    
    
    cell.backgroundColor = [UIColor clearColor];    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}  

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MallDetailViewController *mallDetailVC = [[MallDetailViewController alloc]init];
    [self.navigationController pushViewController:mallDetailVC animated:YES];
}

- (void)viewDidUnload
{
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
