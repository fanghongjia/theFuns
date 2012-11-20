//
//  RegisterViewController.m
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
-(void)dealloc
{
    [hotel_array release];
    [super dealloc];
}

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
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
    [tapRecognizer release];
    
    hotel_tableView  = [[UITableView alloc]initWithFrame:CGRectMake(10, 80, 300, 370) style:UITableViewStylePlain];
    hotel_tableView.delegate = self;
    hotel_tableView.dataSource = self;
    hotel_tableView.backgroundColor = [UIColor whiteColor];
    hotel_tableView.showsVerticalScrollIndicator = YES;
    hotel_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:hotel_tableView];
    [hotel_tableView release];
    
    hotel_array = [[NSArray alloc]initWithObjects:@"省/市:",@"饭店名称:",@"用户名:",@"密码:",@"确认密码:",@"订餐电话:",@"地址:",@"饭店类型:",@"联系人:",@"联系人职务:",@"联系人手机:",@"邀请人ID:", nil];
    
    
}

- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender
{
    UIWindow * keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
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
    if (tableView == hotel_tableView) 
    {
        return 13;
    }
    else 
    {
        return 1;        
    }
    
    
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    static NSString *CellIdentifier = @"Cell";
    
    NSString *TableCellIdentify = [NSString stringWithFormat:@"Cell_%d_%d",indexPath.section,indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableCellIdentify];
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableCellIdentify];
    if (cell == nil) 
    {
        
    }
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableCellIdentify] autorelease];
    
    if (tableView == hotel_tableView) 
    {
        if (indexPath.row < 12 ) 
        {
            for (int i = 0; i<12; i++) 
            {
                UILabel *myLable = [[UILabel alloc]init];
                myLable.frame = CGRectMake(10, 0, 100, 40);
                myLable.backgroundColor = [UIColor clearColor];
                myLable.textAlignment = UITextAlignmentRight;
                myLable.text = [hotel_array objectAtIndex:indexPath.row];
//                myLable.font = [UIFont systemFontOfSize:16.0];
                myLable.textColor = [UIColor blackColor];
                [cell.contentView addSubview:myLable];
                [myLable release]; 
            }
        
        }
        else 
        {
            ;
        }//0 < indexPath.row < 7 ||
        if (indexPath.row == 8 || indexPath.row == 10 || indexPath.row == 11) 
        {
            myTF = [[UITextField alloc]initWithFrame:CGRectMake(115, 10, 170, 31)];
            myTF.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:myTF];
            [myTF release];
        }
        else if (indexPath.row > 0 && indexPath.row < 7) 
        {
            myTF_1 = [[UITextField alloc]initWithFrame:CGRectMake(115, 10, 170, 31)];
            myTF_1.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:myTF_1];
            [myTF_1 release];
        }

        //cell 内容
        
        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xiankuang.png"]];
    }
    
    else 
    {
        
    }
    cell.backgroundColor = [UIColor clearColor];    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}
//定义单元格 间距
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == hotel_tableView) 
    {
        if (indexPath.row <12) 
        {
            return 40;
        }
        else 
        {
            return 60;
        }
    }
    else 
    {
        return 40;
    }
	
}
//跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (IBAction)back_click:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
