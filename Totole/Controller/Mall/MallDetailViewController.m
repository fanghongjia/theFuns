//
//  MallDetailViewController.m
//  Totole
//
//  Created by disan disan on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MallDetailViewController.h"

@interface MallDetailViewController ()

@end


@implementation MallDetailViewController
@synthesize categoryId;

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
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 86, 320, 330) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:mytableView];
    
    tempArr = [[NSArray alloc]init];
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSLog(@"getGiftByCategorydic3 == %@",dic3);
        tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"giftList"] JSONValue];
        NSString *recordCount_string = [[dic3 objectForKey:@"output"] objectForKey:@"recordCount"];
        NSLog(@"tempArr == %@",tempArr);
        NSLog(@"recordCount_string == %@",recordCount_string);
        
        
        mallIdMut = [[NSMutableArray alloc]init];

        for (int i = 0; i<tempArr.count; i++)
        {
            NSString *mallId_string = [[tempArr objectAtIndex:i] objectForKey:@"id"];
            
            [mallIdMut addObject:mallId_string];
        }
        NSLog(@"mallIdMut  == %@",mallIdMut);
        
        
        
        [mytableView reloadData];
    } loadInfo:@"正在加载..." HUDBackView:self.view];
    [daSource getGiftByCategory:self.categoryId pageNo:@"1" pageSise:@"10"];

    
    
}
- (IBAction)popular_click:(id)sender 
{
    [top_imagView setImage:[UIImage imageNamed:@"mall_top1.png"]];
}
- (IBAction)new_click:(id)sender 
{
    [top_imagView setImage:[UIImage imageNamed:@"mall_top2.png"]];
}
- (IBAction)integral_click:(id)sender 
{
    [top_imagView setImage:[UIImage imageNamed:@"mall_top3.png"]];
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
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
        
        
        
         for (int i = 0; i < tempArr.count; i++)
         {
             if (indexPath.row == i)
             {
                 UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
                     
                     
                 NSString *url_string = [[tempArr objectAtIndex:i] objectForKey:@"avatar"];
                 NSLog(@"url_string == %@",url_string);
                     
                [[DataSource shareInstance] loadImageInThread:url_string withView:imageView];
                     
                 [cell.contentView addSubview:imageView];
                 
                 UILabel *lable_1 = [[UILabel alloc]initWithFrame:CGRectMake(65, 5, 240, 35)];
                 lable_1.backgroundColor = [UIColor clearColor];
                 lable_1.text = [[tempArr objectAtIndex:i] objectForKey:@"name"];
                 lable_1.font = [UIFont systemFontOfSize:15.0];
                 [cell addSubview:lable_1];
                 
                 UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(65, 45, 9, 15)];
                 [imageView1 setImage:[UIImage imageNamed:@"mall_star.png"]];
                 [cell addSubview:imageView1];
                 
                 UILabel *lable_price = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, 200, 35)];
                 lable_price.backgroundColor = [UIColor clearColor];
                 NSString *price_str = [[tempArr objectAtIndex:i] objectForKey:@"price"];
                 NSString *str = @"积分";
                 
//                 lable_price.text = price_str;
                 lable_price.font = [UIFont systemFontOfSize:17.0];
                 lable_price.textColor = [UIColor orangeColor];
                 [cell addSubview:lable_price];
                 
                 
                 UIImageView *click_imagView = [[UIImageView alloc]initWithFrame:CGRectMake(290,33,9,14)];
                 [click_imagView setImage:[UIImage imageNamed:@"mall_click.png"]];
                 [cell.contentView addSubview:click_imagView];
             
             }
         }
         
        
        
        
        
        
        
    }
    
    
    //  head_imgeView = [MmUtil loadUserHeadface:[NSString stringWithFormat:@"%@%@",url_string,infoimg]];
    
    
    
    
    
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
