//
//  CookPersonal_TableView.m
//  Totole
//
//  Created by  on 12-11-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CookPersonal_TableView.h"

@implementation CookPersonal_TableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        cook_array = [[NSArray alloc]initWithObjects:@"省/市:",@"用户名:",@"姓名:",@"密码:",@"确认密码:",@"职务:",@"地址:",@"手机:", nil];
        
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        self.showsVerticalScrollIndicator = YES;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.scrollEnabled = NO;
        
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
    
    if (indexPath.row > 0 && indexPath.row < 5) 
    {
        cookPersonal_TF = [[UITextField alloc]initWithFrame:CGRectMake(100, 10, 200, 31)];
        cookPersonal_TF.delegate = self;
        cookPersonal_TF.tag = indexPath.row;
        cookPersonal_TF.font = [UIFont systemFontOfSize:16.0];
        cookPersonal_TF.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:cookPersonal_TF];
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

#pragma mark-
#pragma mark UITextFieldDelegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

@end

