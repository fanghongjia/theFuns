//
//  InputPointsViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InputPointsViewController.h"
#import "InputCell.h"

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowOnDelay:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 410)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.showsVerticalScrollIndicator = NO;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    
    
    myTableView.tableHeaderView = headerView;
    
    numberOfRow = 1;
    
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    myTableView.frame = CGRectMake(0, 0, 320, 410 - 166);
    
   [self performSelector:@selector(keyboardWillShow:) withObject:nil afterDelay:0];
  
}
//键盘将要消失的时候
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    myTableView.frame = CGRectMake(0, 0, 320, 410);
    
    if (doneButton)
    {
        [doneButton removeFromSuperview];
        [doneButton release];
        doneButton=nil;
    }
    return YES;
}

- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender
{
    UIWindow *keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}

//----------数字键盘自定义 Down 按钮
- (void)keyboardWillShowOnDelay:(NSNotification *)notification
{
    for (UITextField *fl in self.view.subviews) {
        

            [self performSelector:@selector(keyboardWillShow:) withObject:nil afterDelay:0];

    }
}

- (void)keyboardWillShow:(NSNotification *)note
{
    
    UIView *foundKeyboard = nil;
    
    UIWindow *keyboardWindow = nil;
    for (UIWindow *testWindow in [[UIApplication sharedApplication] windows])
    {
        if (![[testWindow class] isEqual:[UIWindow class]])
        {
            keyboardWindow = testWindow;
            break;
        }
    }
    if (!keyboardWindow) return;
    
    for (UIView *possibleKeyboard in [keyboardWindow subviews])
    {
        //iOS3
        if ([[possibleKeyboard description] hasPrefix:@"<UIKeyboard"])
        {
            foundKeyboard = possibleKeyboard;
            break;
        }
        else
        {
            // iOS 4 sticks the UIKeyboard inside a UIPeripheralHostView.
            if ([[possibleKeyboard description] hasPrefix:@"<UIPeripheralHostView"])
            {
                possibleKeyboard = [[possibleKeyboard subviews] objectAtIndex:0];
            }
            
            if ([[possibleKeyboard description] hasPrefix:@"<UIKeyboard"])
            {
                foundKeyboard = possibleKeyboard;
                break;
            }
        }
    }
    
    if (foundKeyboard)
    {
        // create custom button
        doneButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 163, 106, 53)];;
        // doneButton.frame = CGRectMake(0, 163, 106, 53);
        doneButton.adjustsImageWhenHighlighted = NO;
        [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
        [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        [foundKeyboard addSubview:doneButton];
    }
}


-(void)doneButton:(UIButton *)sender
{
    for (int i = 0; i < numberOfRow; i ++)
    {
        InputCell *cell = (InputCell *)[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSString *inputStr = cell.input_TF.text;
        NSLog(@"第%d个值:%@", i, inputStr);
    }
}
#pragma mark - Button clicked
- (void)doControlAction:(UIButton *)sender
{
    InputCell *cell = (InputCell *)[sender superview];
    BOOL isAdd = cell.isAdd;
    
    if (isAdd)          // 最后一个
    {
        numberOfRow ++;
        [myTableView reloadData];
    }
    else
    {
        numberOfRow --;
        [myTableView reloadData];
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
    return numberOfRow;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"%d"@"%d",indexPath.section,indexPath.row];//@"TableSampleIdentifier";
    InputCell *cell = (InputCell *)[tableView dequeueReusableCellWithIdentifier:
                                    TableSampleIdentifier];
    
    
    if (cell == nil)
    {
        
        cell = [[InputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
        cell.input_TF.delegate = self;
        
//        UITextField *input_TF = [[UITextField alloc]initWithFrame:CGRectMake(30, 0, 220, 31)];
//        input_TF.borderStyle = UITextBorderStyleRoundedRect;
//        input_TF.keyboardType = UIKeyboardTypeNumberPad;
//        input_TF.backgroundColor = [UIColor whiteColor];
//        [cell.contentView addSubview:input_TF];
//        
//        
//        input_btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        input_btn.frame = CGRectMake(260, 6, 18, 18);
//        //减
//        if (indexPath.row < numberOfRow-1)
//        {
//            [input_btn addTarget:self action:@selector(minusCell:) forControlEvents:UIControlEventTouchUpInside];
//            [input_btn setBackgroundImage:[UIImage imageNamed:@"activate_minus.png"] forState:UIControlStateNormal];
//        }
//        //加
//        else
//        {
//            [input_btn addTarget:self action:@selector(plusCell:) forControlEvents:UIControlEventTouchUpInside];
//            [input_btn setBackgroundImage:[UIImage imageNamed:@"activate_plus.png"] forState:UIControlStateNormal];
//        }
//        
//        [cell.contentView addSubview:input_btn];
//        
//        
//    }
//    else
//    {
//        //减
//        if (indexPath.row < numberOfRow-1)
//        {
//            [input_btn addTarget:self action:@selector(minusCell:) forControlEvents:UIControlEventTouchUpInside];
//            [input_btn setBackgroundImage:[UIImage imageNamed:@"activate_minus.png"] forState:UIControlStateNormal];
//        }
//        //加
//        else
//        {
//            [input_btn addTarget:self action:@selector(plusCell:) forControlEvents:UIControlEventTouchUpInside];
//            [input_btn setBackgroundImage:[UIImage imageNamed:@"activate_plus.png"] forState:UIControlStateNormal];
//        }
//        
////        [cell.contentView addSubview:input_btn];
//    }
    
    
    
    
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
    }
    
    if (numberOfRow - 1 == indexPath.row)
    {
        [cell.input_btn setBackgroundImage:[UIImage imageNamed:@"activate_plus.png"] forState:UIControlStateNormal];
        
        cell.isAdd = YES;
    }
    else
    {
        [cell.input_btn setBackgroundImage:[UIImage imageNamed:@"activate_minus.png"] forState:UIControlStateNormal];
        
        cell.isAdd = NO;
    }
    [cell.input_btn addTarget:self action:@selector(doControlAction:)
             forControlEvents:UIControlEventTouchUpInside];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}  

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 43;
}

-(void)plusCell:(UIButton *)sender
{
    numberOfRow ++;
    myTableView.frame = CGRectMake(0, 120, 320, 43*numberOfRow);
//    back_scrollView.contentSize = CGSizeMake(320, 460+43*numberOfRow);
    NSLog(@"numberOfRow == %d",numberOfRow);
    [myTableView reloadData];
}


-(void)minusCell:(UIButton *)sender
{
    numberOfRow --;
    myTableView.frame = CGRectMake(0, 120, 320, 43*numberOfRow);
//    back_scrollView.contentSize = CGSizeMake(320, 460+43*numberOfRow);
    NSLog(@"numberOfRow == %d",numberOfRow);
    [myTableView reloadData];
}

- (void)viewDidUnload
{
//    back_scrollView = nil;
    headerView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
