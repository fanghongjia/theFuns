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
    
    province_Mutable = [NSMutableArray arrayWithObjects:@"四川",@"重庆",@"甘肃",@"青海",@"贵州",@"云南",@"北京",@"上海",@"天津",@"河北",@"山西",@"内蒙古",@"辽宁",@"吉林",@"黑龙江",@"江苏",@"浙江",@"安徽",@"福建",@"江西",@"山东",@"河南",@"湖北",@"湖南",@"广东",@"广西",@"海南",@"西藏",@"陕西",@"宁夏",@"新疆",nil];
    hotelType_Mutable = [NSMutableArray arrayWithObjects:@"三星级",@"四星级",@"五星级", nil];
    post_Mutable = [NSMutableArray arrayWithObjects:@"经理",@"厨师长",@"配菜", nil];
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
    hotelRegister = YES;
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
        return 13;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
     if (cell == nil) 
     {  
     } 
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
//    NSString *TableCellIdentify = [NSString stringWithFormat:@"Cell_%d_%d",indexPath.section,indexPath.row];
   
//    if (tableView == hotel_tableView) 
//    {
    if (indexPath.row < 12 ) //共13行
    {
        for (int i = 0; i<12; i++) 
        {
            if (indexPath.row == i) 
            {
                UILabel *myLable = [[UILabel alloc]init];
                myLable.frame = CGRectMake(5, 0, 90, 40);
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
        [register_btn addTarget:self action:@selector(register_click:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:register_btn];
        
        
    }//0 < indexPath.row < 7 ||
    if (indexPath.row == 8 || indexPath.row == 10 || indexPath.row == 11) 
    {
        myTF = [[UITextField alloc]initWithFrame:CGRectMake(100, 10, 200, 31)];
        myTF.tag = indexPath.row;
        myTF.font = [UIFont systemFontOfSize:16.0];
        myTF.delegate = self;
        myTF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:myTF];        
    }
    else if (indexPath.row > 0 && indexPath.row < 7) 
    {
        myTF = [[UITextField alloc]initWithFrame:CGRectMake(100, 10, 200, 31)];
        myTF.tag = indexPath.row;
        myTF.font = [UIFont systemFontOfSize:16.0];
        myTF.delegate = self;
        myTF.backgroundColor = [UIColor clearColor];
        if (myTF.tag == 3) 
        {
            myTF.font = [UIFont systemFontOfSize:14.0];
            myTF.secureTextEntry = YES;
            myTF.placeholder = @"6-20个英文字母,数字,下划线";
        }
        if (myTF.tag == 4) 
        {
            myTF.secureTextEntry = YES;
        }
        if (myTF.tag == 5) 
        {
            myTF.placeholder = @"订餐电话或手机号";
        }
        
        [cell.contentView addSubview:myTF];
    }
    
    else if (indexPath.row == 0) 
    {
        province_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[province_btn setFrame:CGRectMake(110, 11, 86, 18)];
		[province_btn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [province_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        province_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        province_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[province_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:province_btn];
		[province_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        city_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[city_btn setFrame:CGRectMake(210, 11, 70, 18)];
		[city_btn setBackgroundImage:[UIImage imageNamed:@"register_DownLittleBox.png"] forState:UIControlStateNormal];
        [city_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        city_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        city_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[city_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:city_btn];
		[city_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (indexPath.row == 7) 
    {
        hotelType_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[hotelType_btn setFrame:CGRectMake(110, 11, 86, 18)];
		[hotelType_btn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [hotelType_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        hotelType_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        hotelType_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[hotelType_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:hotelType_btn];
		[hotelType_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (indexPath.row == 9) 
    {
        post_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[post_btn setFrame:CGRectMake(110, 11, 86, 18)];
		[post_btn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [post_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        post_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        post_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[post_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:post_btn];
		[post_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    

        //cell 内容
//        cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xiankuang.png"]];
//    }

    cell.backgroundColor = [UIColor clearColor];    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}
// 注册，选中饭店or厨师
- (IBAction)registerSelect_click:(id)sender 
{
    if (sender == hotelRegister_btn ) 
    {
        cookPersonal_TableView.hidden = YES;
        hotel_tableView.hidden = NO;
        [hotelRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_HotelSelect.png"] forState:UIControlStateNormal];
        [cookRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_cookNomal.png"] forState:UIControlStateNormal];
        hotelRegister = YES;
    }
    else 
    {
        hotel_tableView.hidden = YES;
        
        if (cookPersonal_TableView) 
        {
            cookPersonal_TableView.hidden = NO;
        } 
        else 
        {
            cookPersonal_TableView = [[CookPersonal_TableView alloc]init];
            cookPersonal_TableView.frame = CGRectMake(10, 100, 300, 310);
//            cookPersonal_TableView = [[CookPersonal_TableView alloc]initWithFrame:CGRectMake(10, 100, 300, 310) style:UITableViewStylePlain];
            [self.view addSubview:cookPersonal_TableView];
        }
        
        [hotelRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_HotelNomal.png"] forState:UIControlStateNormal];
        [cookRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_cookSelect.png"] forState:UIControlStateNormal];
        hotelRegister = NO;
    }
}


#pragma mark - 
#pragma mark Picker DataSource Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == province_PickView) 
    {
        return province_Mutable.count;
    }
    else if (pickerView == city_PickView) 
    {
        return city_Mutable.count;
    }
    else if (pickerView == hotelType_PickView) 
    {
        return hotelType_Mutable.count;
    }
    else 
    {
        return post_Mutable.count;
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == province_PickView) 
    {
        return [province_Mutable objectAtIndex:row];
    }
    else if (pickerView == city_PickView) 
    {
        return [city_Mutable objectAtIndex:row];
    }
    else if (pickerView == hotelType_PickView) 
    {
        return [hotelType_Mutable objectAtIndex:row];
    }
    else 
    {
        return [post_Mutable objectAtIndex:row];
    }
}


-(void)pickerViewSelect:(UIButton *)sender
{
    if (sender == province_btn) 
    {
        [province_PickView reloadAllComponents];
        [self.view bringSubviewToFront:province_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = NO;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }
    else if (sender == city_btn) 
    {
        [city_PickView reloadAllComponents];
        [self.view bringSubviewToFront:city_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = NO;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }
    else if (sender == hotelType_btn) 
    {
        [hotelType_PickView reloadAllComponents];
        [self.view bringSubviewToFront:hotelType_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = NO;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }
    else 
    {
        [post_PickView reloadAllComponents];
        [self.view bringSubviewToFront:post_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = NO;
        toolbar.hidden = NO;
    }
    
}
//确定按钮
- (IBAction)infoSelect_click:(id)sender 
{ 
    int province_selectedRow = [province_PickView  selectedRowInComponent:0 ];
    int city_selectedRow = [city_PickView  selectedRowInComponent:0 ];
    int hotelType_selectedRow = [hotelType_PickView  selectedRowInComponent:0 ];
    int post_selectedRow = [post_PickView  selectedRowInComponent:0 ];
    
    province_PickView.hidden = YES;
    city_PickView.hidden = YES;
    toolbar.hidden = YES;
    hotelType_PickView.hidden = YES;
    post_PickView.hidden = YES;
    
    province_btn.titleLabel.text = [province_Mutable objectAtIndex:province_selectedRow];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    city_Mutable = [[[NSMutableArray alloc] initWithContentsOfFile:path] objectAtIndex:province_selectedRow];    
    city_btn.titleLabel.text = [city_Mutable objectAtIndex:city_selectedRow];    
    
    hotelType_btn.titleLabel.text = [hotelType_Mutable objectAtIndex:hotelType_selectedRow];
    
    post_btn.titleLabel.text = [post_Mutable objectAtIndex:post_selectedRow];
}

#pragma mark-
#pragma mark UITextFieldDelegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
       
    [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
    [UIView setAnimationDuration:.3f];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;

    if (textField.tag == 10) 
    {
        textField.keyboardType = UIKeyboardTypeNumberPad;
        CGRect rect = CGRectMake(0.0f, -130, width, height);
        self.view.frame= rect;
    }
    else if (textField.tag == 8) 
    {
        CGRect rect = CGRectMake(0.0f, -60, width, height);
        self.view.frame= rect;
    }
    else if (textField.tag == 11) 
    {
        CGRect rect = CGRectMake(0.0f, -225, width, height);
        self.view.frame= rect;
    }
    else if(textField.tag == 5 || textField.tag == 12)
    {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
        
    [UIView commitAnimations];
    

    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.tag == 10 || textField.tag == 8 ||textField.tag == 11) 
    {
        for(UIView*view in self.view.subviews) 
        {
            [view resignFirstResponder];            
            [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
            [UIView setAnimationDuration:.3f];
            float width = self.view.frame.size.width;
            float height = self.view.frame.size.height;
            CGRect rect = CGRectMake(0.0f, .0f, width, height);
            self.view.frame= rect;
            
            [UIView commitAnimations];
        }
    }
      
    return YES;
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
    
    NSLog(@"myTF.text == %@",myTF.text);
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
    province_PickView = nil;
    toolbar = nil;
    city_PickView = nil;
    hotelType_PickView = nil;
    post_PickView = nil;
    hotelRegister_btn = nil;
    cookRegister_btn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
