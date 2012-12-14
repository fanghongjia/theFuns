//
//  MyOrderViewController.m
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import "MyOrderViewController.h"
#import "MyOrderCell.h"
#import "OrderSearchViewController.h"

@interface MyOrderViewController ()

@end

@implementation MyOrderViewController

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
    
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 46, 320, 365) style:UITableViewStylePlain];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    mytableView.showsVerticalScrollIndicator = NO;
    mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mytableView.layer.cornerRadius = 10.0;
    mytableView.layer.masksToBounds = YES;
    [self.view addSubview:mytableView];

}
- (IBAction)search_click:(id)sender
{
    OrderSearchViewController *orderSearchVC = [[OrderSearchViewController alloc]init];
    [self.navigationController pushViewController:orderSearchVC animated:YES];
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
    return 3;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row];
    MyOrderCell *cell = (MyOrderCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[MyOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_back.png"]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
