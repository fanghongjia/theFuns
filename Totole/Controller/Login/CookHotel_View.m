//
//  CookHotel_View.m
//  Totole
//
//  Created by disan disan on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CookHotel_View.h"

@implementation CookHotel_View

@synthesize CookHotel_viewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        
        cook_array = [[NSArray alloc]initWithObjects:@"饭店名称:",@"饭店所在省/市:",@"饭店地址:",@"订餐电话:",@"邀请人ID:", nil];
        cookHotel_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 32, 300, 280-1) style:UITableViewStylePlain];
        
        cookHotel_tableView.layer.cornerRadius = 10.0;
        cookHotel_tableView.layer.masksToBounds = YES;
        cookHotel_tableView.delegate = self;
        cookHotel_tableView.dataSource = self;
        cookHotel_tableView.backgroundColor = [UIColor whiteColor];
        cookHotel_tableView.showsVerticalScrollIndicator = YES;
        cookHotel_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        cookHotel_tableView.scrollEnabled = NO;
        [self addSubview:cookHotel_tableView];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 95, 21)];
        lable.backgroundColor = [UIColor clearColor];
        lable.text = @"饭店信息";
        lable.textColor = [UIColor colorWithRed:174/255.0 green:180/255.0 blue:192/255.0 alpha:1];
        [self addSubview:lable];
        
        
        agree = YES;
    }
    return self;
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
    return 6;
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
    
    for (int i = 0; i<5; i++) 
    {
        if (indexPath.row == i) 
        {
            UILabel *myLable = [[UILabel alloc]init];
            myLable.frame = CGRectMake(0, 0, 113, 40);
            myLable.backgroundColor = [UIColor clearColor];
            myLable.textAlignment = UITextAlignmentRight;
            myLable.text = [cook_array objectAtIndex:indexPath.row];
            //                myLable.font = [UIFont systemFontOfSize:16.0];
            [cell.contentView addSubview:myLable];
        }
        
    }
    if (indexPath.row == 0) 
    {
        hotelName_TF = [[UITextField alloc]initWithFrame:CGRectMake(120, 10, 200, 31)];
        hotelName_TF.tag = indexPath.row;
        hotelName_TF.delegate = self;
        hotelName_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:hotelName_TF];
    }
    else if (indexPath.row == 1) 
    {
        provinceCook_btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[provinceCook_btn setFrame:CGRectMake(120, 11, 86, 18)];
		[provinceCook_btn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [provinceCook_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        provinceCook_btn.tag = 10;
        provinceCook_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        provinceCook_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[provinceCook_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:provinceCook_btn];
		[provinceCook_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        cityCook_btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[cityCook_btn setFrame:CGRectMake(220, 11, 70, 18)];
		[cityCook_btn setBackgroundImage:[UIImage imageNamed:@"register_DownLittleBox.png"] forState:UIControlStateNormal];
        [cityCook_btn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        cityCook_btn.tag = 11;
        cityCook_btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        cityCook_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		[cityCook_btn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:cityCook_btn];
		[cityCook_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }

    else if (indexPath.row == 2) 
    {
        hotelAddress_TF = [[UITextField alloc]initWithFrame:CGRectMake(120, 10, 200, 31)];
        hotelAddress_TF.tag = indexPath.row;
        hotelAddress_TF.delegate = self;
        hotelAddress_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:hotelAddress_TF];
    }
    else if (indexPath.row == 3) 
    {
        orderPhone_TF = [[UITextField alloc]initWithFrame:CGRectMake(120, 10, 200, 31)];
        orderPhone_TF.tag = indexPath.row;
        orderPhone_TF.placeholder = @"订餐电话或手机";
        orderPhone_TF.keyboardType = UIKeyboardTypeNumberPad;
        orderPhone_TF.delegate = self;
        orderPhone_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:orderPhone_TF];        
    }
    else if (indexPath.row == 4) 
    {
        inviteesID_TF = [[UITextField alloc]initWithFrame:CGRectMake(120, 10, 200, 31)];
        inviteesID_TF.tag = indexPath.row;
        inviteesID_TF.keyboardType = UIKeyboardTypeNumberPad;
        inviteesID_TF.delegate = self;
        inviteesID_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:inviteesID_TF];
    }
    else if (indexPath.row == 5) 
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
    }
    
 
    cell.backgroundColor = [UIColor clearColor];    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

//定义单元格 间距
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    if (indexPath.row < 5) 
    {
        return 40;
    }
    else 
    {
        return 80;
    }
}

// 省市选择
-(void)pickerViewSelect:(UIButton *)sender
{
    if (CookHotel_viewDelegate  && [CookHotel_viewDelegate respondsToSelector:@selector(cookHotel_selectedControlFromPickView:indexAtControl:)])
    {
        [CookHotel_viewDelegate cookHotel_selectedControlFromPickView:self indexAtControl:sender.tag];        
    }
}

#pragma mark-
#pragma mark 注册点击
-(void)register_click:(UIButton *)sender
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

-(void)agreement:(UIButton *)sender
{
    
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
        CGRect rect = CGRectMake(10.0f, -17, width, height);
        self.frame= rect;
    }

    [UIView commitAnimations];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    if (textField.tag == 3 ||textField.tag == 4  || textField.tag == 2 ) 
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
