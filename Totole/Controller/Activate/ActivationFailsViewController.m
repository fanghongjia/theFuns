//
//  ActivationFailsViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ActivationFailsViewController.h"
#import "ActivaeResultCell.h"

@interface ActivationFailsViewController ()

@end

@implementation ActivationFailsViewController

@synthesize failedList_arr,incomeScore_str;

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
    
    
    incomeScore_la.text = self.incomeScore_str;
    
//    self.failedList_arr = [[NSArray alloc]init];
    
    NSLog(@"failedList_arr == %@",self.failedList_arr);
    NSLog(@"self.incomeScore_str == %@",self.incomeScore_str);
    
    
    resule_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 410)];
    resule_tableView.delegate = self;
    resule_tableView.dataSource = self;
    resule_tableView.backgroundColor = [UIColor clearColor];
    resule_tableView.showsVerticalScrollIndicator = NO;
    resule_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:resule_tableView];
    
    resule_tableView.tableHeaderView = head_view;
    resule_tableView.tableFooterView = foot_view;
    
    
}
- (IBAction)ContinueToScan_click:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.selectedIndex = 1;
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
    return self.failedList_arr.count;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row];//@"TableSampleIdentifier";
    ActivaeResultCell *cell = (ActivaeResultCell *)[tableView dequeueReusableCellWithIdentifier:
                                    TableSampleIdentifier];
    
    
    if (cell == nil)
    {        
        cell = [[ActivaeResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
        cell.barcode_lb.text = [self.failedList_arr objectAtIndex:indexPath.row];
    }
    
        
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}  

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)viewDidUnload
{
    head_view = nil;
    foot_view = nil;
    incomeScore_la = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
