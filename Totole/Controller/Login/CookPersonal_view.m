//
//  CookPersonal_view.m
//  Totole
//
//  Created by disan disan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CookPersonal_view.h"

@implementation CookPersonal_view

@synthesize CookPersonal_viewDelegate;
@synthesize province_btn,city_btn,post_btn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        cook_array = [[NSArray alloc]initWithObjects:@"省/市:",@"用户名:",@"姓名:",@"密码:",@"确认密码:",@"职务:",@"地址:",@"手机:", nil];
        
        cookPersonal_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 32, 300, 36*8-1) style:UITableViewStylePlain];
        
        cookPersonal_tableView.layer.cornerRadius = 10.0;
        cookPersonal_tableView.layer.masksToBounds = YES;
        cookPersonal_tableView.delegate = self;
        cookPersonal_tableView.dataSource = self;
        cookPersonal_tableView.backgroundColor = [UIColor whiteColor];
        cookPersonal_tableView.showsVerticalScrollIndicator = YES;
        cookPersonal_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        cookPersonal_tableView.scrollEnabled = NO;
        [self addSubview:cookPersonal_tableView];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 83, 21)];
        lable.backgroundColor = [UIColor clearColor];
        lable.text = @"个人信息";
        lable.textColor = [UIColor colorWithRed:174/255.0 green:180/255.0 blue:192/255.0 alpha:1];
        [self addSubview:lable];
        
        
        next_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        next_btn.frame = CGRectMake(70, 330, 182, 20);
        [next_btn setBackgroundImage:[UIImage imageNamed:@"register_next.png"] forState:UIControlStateNormal];
        [next_btn addTarget:self action:@selector(next_click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:next_btn];
        
    }
    return self;
}
//下一步
-(void)next_click:(UIButton *)sender
{
//    self.hidden = YES;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:userName_TF.text forKey:@""];
    
    if (CookPersonal_viewDelegate  && [CookPersonal_viewDelegate respondsToSelector:@selector(nextStepRegister:diction:)]) 
    {
        [CookPersonal_viewDelegate nextStepRegister:self diction:dic];
        
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
    return 8;
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
    
    for (int i = 0; i<8; i++) 
    {
        if (indexPath.row == i) 
        {
            UILabel *myLable = [[UILabel alloc]init];
            myLable.frame = CGRectMake(5, 0, 90, 40);
            myLable.backgroundColor = [UIColor clearColor];
            myLable.textAlignment = UITextAlignmentRight;
            myLable.text = [cook_array objectAtIndex:indexPath.row];
            //                myLable.font = [UIFont systemFontOfSize:16.0];
            [cell.contentView addSubview:myLable];
        }
        
    }
    
    if (indexPath.row == 0) 
    {
        province_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[province_btn setFrame:CGRectMake(110, 11, 86, 18)];
		[province_btn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [province_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        province_btn.tag = 1000;
        province_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        province_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[province_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:province_btn];
		[province_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        city_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[city_btn setFrame:CGRectMake(210, 11, 70, 18)];
		[city_btn setBackgroundImage:[UIImage imageNamed:@"register_DownLittleBox.png"] forState:UIControlStateNormal];
        [city_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        city_btn.tag = 1001;
        city_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        city_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[city_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:city_btn];
		[city_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (indexPath.row == 5) 
    {
        post_btn=[UIButton buttonWithType:UIButtonTypeCustom];
		[post_btn setFrame:CGRectMake(110, 11, 86, 18)];
		[post_btn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [post_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        post_btn.tag = 1002;
        post_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        post_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[post_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:post_btn];
		[post_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    else if (indexPath.row == 1) 
    {
        userName_TF = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 200, 31)];
        userName_TF.tag = indexPath.row;
        userName_TF.delegate = self;
        userName_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:userName_TF];
    }
    else if (indexPath.row == 2) 
    {
        name_TF = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 200, 31)];
        name_TF.tag = indexPath.row;
        name_TF.delegate = self;
        name_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:name_TF];
    }
    else if (indexPath.row == 3) 
    {
        password_TF = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 200, 31)];
        password_TF.tag = indexPath.row;
        password_TF.delegate = self;
        password_TF.backgroundColor = [UIColor clearColor];
        password_TF.font = [UIFont systemFontOfSize:14.0];
        password_TF.secureTextEntry = YES;
        password_TF.placeholder = @"6-20个英文字母,数字.下划线";
        [cell.contentView addSubview:password_TF];
    }
    else if (indexPath.row == 4) 
    {
        confirmPassword_TF = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 200, 31)];
        confirmPassword_TF.tag = indexPath.row;
        confirmPassword_TF.secureTextEntry = YES;
        confirmPassword_TF.delegate = self;
        confirmPassword_TF.font = [UIFont systemFontOfSize:14.0];
        confirmPassword_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:confirmPassword_TF];
    }
    else if (indexPath.row == 6) 
    {
        address_TF = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 200, 31)];
        address_TF.tag = indexPath.row;
        address_TF.delegate = self;
        address_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:address_TF];
    }
    else if (indexPath.row == 7) 
    {
        phone_TF = [[UITextField alloc]initWithFrame:CGRectMake(110, 10, 200, 31)];
        phone_TF.tag = indexPath.row;
        phone_TF.delegate = self;
        phone_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:phone_TF];
    }
        
    
    cell.backgroundColor = [UIColor clearColor];    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

//定义单元格 间距
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}

//选择省市等
-(void)pickerViewSelect:(UIButton *)sender
{
    [self.CookPersonal_viewDelegate cook_selectedControlFromPickView:self indexAtControl:sender.tag];
}



#pragma mark-
#pragma mark UITextFieldDelegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
    [UIView setAnimationDuration:.3f];
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    
    if (textField.tag == 2) 
    {
        CGRect rect = CGRectMake(10.0f, -10, width, height);
        self.frame= rect;
    }
    else if (textField.tag == 3) 
    {
        CGRect rect = CGRectMake(10.0f, -2, width, height);
        self.frame= rect;
    }
    else if (textField.tag == 4) 
    {
        CGRect rect = CGRectMake(10.0f, -15, width, height);
        self.frame= rect;
    }
    else if (textField.tag == 6) 
    {
        CGRect rect = CGRectMake(10.0f, -80, width, height);
        self.frame= rect;
    }
    else if (textField.tag == 7) 
    {
        textField.keyboardType = UIKeyboardTypeNumberPad;
        CGRect rect = CGRectMake(10.0f, -115, width, height);
        self.frame= rect;
    }

    
    [UIView commitAnimations];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{

    if (textField.tag == 2 || textField.tag == 3 ||textField.tag == 4  || textField.tag == 6 ||textField.tag == 7) 
    {
        for(UIView*view in self.subviews) 
        {
            [view resignFirstResponder];            
            [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
            [UIView setAnimationDuration:.3f];
            float width = self.frame.size.width;
            float height = self.frame.size.height;
            CGRect rect = CGRectMake(10.0f, 72.0f, width, height);
            self.frame= rect;
            
            [UIView commitAnimations];
        }
    }
    
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
