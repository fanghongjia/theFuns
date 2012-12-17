//
//  ShoppingCartViewController.m
//  Totole
//
//  Created by disan disan on 12-12-10.
//
//

#import "ShoppingCartViewController.h"
#import "ShoppingCell.h"
#import "ConfirmOrderViewController.h"
#import "MallDetailViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

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
    shopMutArr = [[NSMutableArray alloc]init];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    shopMutArr = [NSMutableArray arrayWithArray: [userDefault objectForKey:@"shoppingArr"]];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 76, 300, 275) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor whiteColor];
    mytableView.showsVerticalScrollIndicator = YES;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    mytableView.separatorColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1];
    mytableView.layer.cornerRadius = 10.0;
    mytableView.layer.masksToBounds = YES;
    mytableView.tableFooterView = headView;
//    [mytableView setEditing:YES animated:YES];
    [self.view addSubview:mytableView];
}

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)confirmOrder_click:(id)sender
{
    ConfirmOrderViewController *confirmOrderVC = [[ConfirmOrderViewController alloc]init];
    [self.navigationController pushViewController:confirmOrderVC animated:YES];
}
- (IBAction)goOnShop_click:(id)sender
{
//    MallDetailViewController
//    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    MallViewController *mallVC = [[MallViewController alloc]init];
    [self.navigationController pushViewController:mallVC animated:YES];
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
    return shopMutArr.count;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row];
    ShoppingCell *cell = (ShoppingCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[ShoppingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];        
    }
    
    [[DataSource shareInstance]loadImageInThread:[[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"avatar"] withView:cell.imageView];
    
    cell.lable_1.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"giftName"];
    cell.lable_price.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"price"];
    cell.lable_unit.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"unit"];
    cell.number_TF.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"number"];
    
    cell.delete_btn.tag = indexPath.row;   
    
    [cell.plus_btn addTarget:self action:@selector(plus:) forControlEvents:UIControlEventTouchUpInside];
    [cell.minu_btn addTarget:self action:@selector(minu:) forControlEvents:UIControlEventTouchUpInside];
    [cell.delete_btn addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)plus:(UIButton *)sender
{
    
}

-(void)minu:(UIButton *)sender
{
    
}

//删除cell
-(void)delete:(UIButton *)sender
{
    NSLog(@"row == %d",sender.tag);
    [shopMutArr removeObjectAtIndex:sender.tag];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:shopMutArr forKey:@"shoppingArr"];
      
    NSLog(@"shopMutArr.count == %d",shopMutArr.count);
    NSLog(@"shopMutArr == %@",shopMutArr);
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    [mytableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationFade];
    [mytableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    headView = nil;
    [super viewDidUnload];
}
@end
