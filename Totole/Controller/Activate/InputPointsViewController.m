//
//  InputPointsViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InputPointsViewController.h"

@interface InputPointsViewController ()

@end

@implementation InputPointsViewController

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
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 120, 320, 40)];
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
    return 1;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    
    
    
    
    /*
    for (int i = 0; i < reader_MutableArr.count; i++) 
    {
        if (indexPath.row == i) 
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 304, 70)];
            [imageView setImage:[UIImage imageNamed:@"activate_resultRG.png"]];
            [cell addSubview:imageView];
            
            UILabel *lable_1 = [[UILabel alloc]initWithFrame:CGRectMake(42, 10, 82, 24)];
            lable_1.backgroundColor = [UIColor clearColor];
            lable_1.text = @"激活号码：";
            lable_1.font = [UIFont systemFontOfSize:15.0];
            [cell addSubview:lable_1];
            
            
            UILabel *lable_2 = [[UILabel alloc]initWithFrame:CGRectMake(42, 38, 82, 24)];
            lable_2.backgroundColor = [UIColor clearColor];
            lable_2.text = @"激活状态：";
            lable_2.font = [UIFont systemFontOfSize:15.0];
            [cell addSubview:lable_2];
            
            UILabel *lableNumber = [[UILabel alloc]initWithFrame:CGRectMake(124, 10, 200, 24)];
            lableNumber.backgroundColor = [UIColor clearColor];
            lableNumber.text = [reader_MutableArr objectAtIndex:i];
            lableNumber.font = [UIFont systemFontOfSize:15.0];
            [cell addSubview:lableNumber];
            
            UILabel *lableState = [[UILabel alloc]initWithFrame:CGRectMake(124, 38, 82, 24)];
            lableState.backgroundColor = [UIColor clearColor];
            lableState.text = [reader_MutableArr objectAtIndex:i];
            lableState.font = [UIFont systemFontOfSize:15.0];
            [cell addSubview:lableState];
            
            cell.backgroundColor = [UIColor clearColor];    
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    */
    
    return cell;
}  

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
