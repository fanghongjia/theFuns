//
//  ConfirmOrderViewController.m
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import "ConfirmOrderViewController.h"
#import "ConfirmOrderCell.h"
#import "SubmitSuccefulViewController.h"


@interface ConfirmOrderViewController ()

@end

@implementation ConfirmOrderViewController

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
    mytableView.tableFooterView = foot_view;
    //    [mytableView setEditing:YES animated:YES];
    [self.view addSubview:mytableView];
}

- (IBAction)back_click:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submit_click:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                   message:@"提交成功,确认后查看您的订单"
                                                  delegate:self
                                         cancelButtonTitle:@"确定"
                                         otherButtonTitles:@"取消", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        NSLog(@"取消");
    }
    else if (buttonIndex == 0)
    {
        SubmitSuccefulViewController *submitSuccefulVC = [[SubmitSuccefulViewController alloc]init];
        [self.navigationController pushViewController:submitSuccefulVC animated:YES];
        
    }
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
    ConfirmOrderCell *cell = (ConfirmOrderCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[ConfirmOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    
    cell.lable_1.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"giftName"];
    cell.lable_price.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"price"];
    cell.lable_unit.text = [[shopMutArr objectAtIndex:indexPath.row]objectForKey:@"unit"];
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    foot_view = nil;
    [super viewDidUnload];
}
@end
