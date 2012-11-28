//
//  CookPersonal_view.m
//  Totole
//
//  Created by disan disan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CookPersonal_view.h"

@implementation CookPersonal_view

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
    else if (indexPath.row == 5) 
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

-(void)pickerViewSelect:(UIButton *)sender
{
    
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
