//
//  AccountHistoryViewController.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "AccountHistoryViewController.h"
#import "AccountHistoryCell.h"

@interface AccountHistoryViewController ()

@end

@implementation AccountHistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        mytableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 120, 300, 280) style:UITableViewStylePlain];
        mytableView.delegate = self;
        mytableView.dataSource = self;
        mytableView.backgroundColor = [UIColor whiteColor];
        mytableView.showsVerticalScrollIndicator = NO;
        mytableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        mytableView.layer.cornerRadius = 10.0;
        mytableView.layer.masksToBounds = YES;
        [self.view addSubview:mytableView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    AccountHistoryCell *cell = (AccountHistoryCell *)[tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    if (cell == nil)
    {
        cell = [[AccountHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    
    
    
    cell.backgroundColor = [UIColor clearColor];
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
