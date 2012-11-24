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
    self.navigationController.navigationBarHidden = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    hotel_tableView  = [[UITableView alloc]initWithFrame:CGRectMake(10, 80, 300, 370) style:UITableViewStylePlain];
    hotel_tableView.delegate = self;
    hotel_tableView.dataSource = self;
    hotel_tableView.backgroundColor = [UIColor whiteColor];
    hotel_tableView.showsVerticalScrollIndicator = YES;
    hotel_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    hotel_tableView.contentSize = CGSizeMake(300, 2800);
    [self.view addSubview:hotel_tableView];
    
    hotel_array = [[NSArray alloc]initWithObjects:@"省/市:",@"饭店名称:",@"用户名:",@"密码:",@"确认密码:",@"订餐电话:",@"地址:",@"饭店类型:",@"联系人:",@"联系人职务:",@"联系人手机:",@"邀请人ID:", nil];
    
    agree = YES;
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
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableCellIdentify];
    
    if (tableView == hotel_tableView) 
    {
        if (indexPath.row < 12 ) //共13行
        {
            for (int i = 0; i<12; i++) 
            {
                if (indexPath.row == i) 
                {
                    UILabel *myLable = [[UILabel alloc]init];
                    myLable.frame = CGRectMake(10, 0, 100, 40);
                    myLable.backgroundColor = [UIColor clearColor];
                    myLable.textAlignment = UITextAlignmentRight;
                    myLable.text = [hotel_array objectAtIndex:indexPath.row];
                    //                myLable.font = [UIFont systemFontOfSize:16.0];
                    [cell.contentView addSubview:myLable];
                }
                
            }
        
        }
        else 
        {
            UIButton *agree_button = [UIButton buttonWithType:UIButtonTypeCustom];
            [agree_button setBackgroundImage:[UIImage imageNamed:@"register_agree.png"] forState:UIControlStateNormal];
            agree_button.frame = CGRectMake(45, 10, 10, 10);
            [agree_button addTarget:self action:@selector(register_agree:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:agree_button];
            
            UIButton *agreement_btn = [UIButton buttonWithType:UIButtonTypeCustom];
            agreement_btn.frame = CGRectMake(60, 0, 200, 30);
            [agreement_btn setTitle:@"同意《NTA饭店联盟协议》" forState:UIControlStateNormal];
            agreement_btn.titleLabel.font = [UIFont systemFontOfSize:15];
            agreement_btn.titleLabel.textAlignment = UITextAlignmentLeft;
            [agreement_btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
            [agreement_btn addTarget:self action:@selector(agreement:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:agreement_btn];
            
            UIButton *register_btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [register_btn setBackgroundImage:[UIImage imageNamed:@"register_register.png"] forState:UIControlStateNormal];
            register_btn.frame = CGRectMake(110, 30, 80, 35);
            [agree_button addTarget:self action:@selector(register_click:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:register_btn];
            
            
        }//0 < indexPath.row < 7 ||
        if (indexPath.row == 8 || indexPath.row == 10 || indexPath.row == 11) 
        {
            myTF = [[UITextField alloc]initWithFrame:CGRectMake(115, 10, 170, 31)];
            myTF.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:myTF];
        }
        else if (indexPath.row > 0 && indexPath.row < 7) 
        {
            myTF_1 = [[UITextField alloc]initWithFrame:CGRectMake(115, 10, 170, 31)];
            myTF_1.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:myTF_1];
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
            return 80;
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

-(void)register_agree:(UIButton *)sender
{
    if (agree == YES) 
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"register_disagree.png"] forState:UIControlStateNormal];
        agree = NO;
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"register_agree.png"] forState:UIControlStateNormal];
        agree = YES;
    }
}
#pragma mark-
#pragma mark 注册
-(void)register_click:(UIButton *)sender
{
    
}

-(void)agreement:(UIButton *)sender
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
