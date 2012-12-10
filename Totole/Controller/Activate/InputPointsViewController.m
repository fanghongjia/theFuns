//
//  InputPointsViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InputPointsViewController.h"
#import "InputCell.h"
#import "ActivationFailsViewController.h"

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
    //条形码数组
    tempArr = [[NSMutableArray alloc]init];
//    failedList_arr = [[NSMutableArray alloc]init];
    arrValues = [[NSMutableArray alloc] initWithCapacity:1];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowOnDelay:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillDisappear:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    arrTags = [[NSMutableArray alloc] initWithCapacity:1];
    [arrTags addObject:@"0"];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 410)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.showsVerticalScrollIndicator = YES;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    
    
    myTableView.tableHeaderView = headerView;
    
    

}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
   [self performSelector:@selector(keyboardWillShow:) withObject:nil afterDelay:0];
  
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
//    NSString *key = [NSString stringWithFormat:@"%d", textField.tag - 1000];
//    
//    for (NSDictionary *d in arrValues)
//    {
//        if ([d objectForKey:key])
//        {
//            [arrValues removeObject:d];
//            
//            break;
//        }
//    }
//    
//    NSDictionary *dict = [[NSDictionary alloc]
//                          initWithObjectsAndKeys:textField.text, key, nil];
//    [arrValues addObject:dict];
//       
//    NSLog(@"文本值: %@", arrValues);
    if (doneButton)
    {
        [doneButton removeFromSuperview];
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

- (void)keyboardWillDisappear:(NSNotification *)note
{
    myTableView.frame = CGRectMake(0, 0, 320, 410);
}

- (void)keyboardWillShow:(NSNotification *)note
{
    myTableView.frame = CGRectMake(0, 0, 320, 410 - 166);
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
    
    for (__strong UIView *possibleKeyboard in [keyboardWindow subviews])
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
//    for (int i = 0; i < [arrValues count]; i ++)
//    {
    BOOL hasNil = NO;
    for (UITextField *field in arrValues)
    {
        if (field.text.length > 0)
        {
            NSMutableDictionary *jsonDic = [[NSMutableDictionary alloc]init];
            [jsonDic setObject:field.text forKey:@"integralCode"];//条形码
            
            [tempArr addObject:jsonDic];
        }
        else
        {
            hasNil = YES;
        }        
    }
    
    if (hasNil == YES)
    {
        // 潘孔
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"系统提示!"
                                                       message:@"请填写完整!"
                                                      delegate:nil
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
//    NSLog(@"jsonDic == %@",jsonDic);
    NSLog(@"tempArr == %@",tempArr);
    
    DataSource *dataSource = [DataSource interFaceWithBlocks:^(id response)
                              {
                                  NSDictionary *dic2 = response;
                                  NSLog(@"dic2dic =-----=  %@",dic2);
                                  NSDictionary *respond_dic = [[NSDictionary alloc]init];
                                  respond_dic = [dic2 objectForKey:@"output"];
                                  
                                  failedList_str = [respond_dic objectForKey:@"failedList"];
                                  NSString *incomeScore_str = [respond_dic objectForKey:@"incomeScore"];
                                  NSLog(@"failedList_str == %@",failedList_str);
                                  
                                  
                                  NSString *changeStr = [[[[failedList_str
                                                          stringByReplacingOccurrencesOfString:@"\"" withString:@""]
                                                         stringByReplacingOccurrencesOfString:@"[" withString:@""]
                                                          stringByReplacingOccurrencesOfString:@"]" withString:@""]
                                                         stringByReplacingOccurrencesOfString:@"\\" withString:@""];
                                  NSLog(@"changeStr == %@",changeStr);
                                  NSArray *array = nil;
                                  array =  [changeStr componentsSeparatedByString:@","];
                                  NSLog(@"array == %@",array);
                                  
                                  ActivationFailsViewController *resuleVC = [[ActivationFailsViewController alloc]init];
                                  resuleVC.failedList_arr = array;
                                  resuleVC.incomeScore_str = incomeScore_str;
                                   NSLog(@"incomeScore_str == %@",incomeScore_str);
                                  NSLog(@"resuleVC.failedList_arr == %@",resuleVC.failedList_arr);
                                  [self.navigationController pushViewController:resuleVC animated:YES];
                                  
                              } loadInfo:@"正在加载..." HUDBackView:self.view];
    [dataSource activateScoreintegralCodeList:tempArr];
}
#pragma mark - Button clicked
- (void)doControlAction:(UIButton *)sender
{
    InputCell *cell = (InputCell *)[sender superview];
    BOOL isAdd = cell.isAdd;
    
    if (isAdd)          // 最后一个
    {
        NSInteger lastIndex = [[arrTags lastObject] intValue] + 1;
        [arrTags addObject:[NSString stringWithFormat:@"%d", lastIndex]];
        [myTableView reloadData];
    }
    else
    {
        [arrTags removeObject:[NSString stringWithFormat:@"%d", cell.cellTag]];
        [arrValues removeObject:cell.input_TF];
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
    return [arrTags count];
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSInteger unitTag = [[arrTags objectAtIndex:indexPath.row] intValue];
    NSString *TableSampleIdentifier = [NSString stringWithFormat:@"CellIdentifier_%d",unitTag];
    InputCell *cell = (InputCell *)[tableView dequeueReusableCellWithIdentifier:
                                    TableSampleIdentifier];
    
    
    if (cell == nil)
    {
        cell = [[InputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
        cell.input_TF.delegate = self;
        cell.cellTag = unitTag;
        cell.input_TF.tag = unitTag + 1000;
        [arrValues addObject:cell.input_TF];
    }
    
    if ([arrTags count] - 1 == indexPath.row)
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

//-(void)plusCell:(UIButton *)sender
//{
//    numberOfRow ++;
//    myTableView.frame = CGRectMake(0, 120, 320, 43*numberOfRow);
////    back_scrollView.contentSize = CGSizeMake(320, 460+43*numberOfRow);
//    NSLog(@"numberOfRow == %d",numberOfRow);
//    [myTableView reloadData];
//}
//
//
//-(void)minusCell:(UIButton *)sender
//{
//    numberOfRow --;
//    myTableView.frame = CGRectMake(0, 120, 320, 43*numberOfRow);
////    back_scrollView.contentSize = CGSizeMake(320, 460+43*numberOfRow);
//    NSLog(@"numberOfRow == %d",numberOfRow);
//    [myTableView reloadData];
//}

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
