//
//  ActivateViewController.m
//  Totole
//
//  Created by  on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ActivateViewController.h"

@implementation ActivateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [self scanButtonTapped:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    
    
    /*
    if (reader_MutableArr) 
    {
        ;
    }
    else 
    {
        reader_MutableArr = [[NSMutableArray alloc]init];
    }
    
    NSLog(@"reader_MutableArr.count == %d",reader_MutableArr.count);
    myScrollView.contentSize = CGSizeMake(320, 410+reader_MutableArr.count*78-78);
    myView.frame = CGRectMake(0, 142+reader_MutableArr.count*78-78, 320, 226);
    
    
    if (myTableView) 
    {
        myTableView.frame = CGRectMake(8, 48, 304, 78*reader_MutableArr.count);
    }
    else 
    {
        myTableView = [[UITableView alloc]initWithFrame:CGRectMake(8, 48, 304, 78*reader_MutableArr.count)];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.backgroundColor = [UIColor clearColor];
        myTableView.showsVerticalScrollIndicator = NO;
        myTableView.scrollEnabled = NO;
        myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [myScrollView addSubview:myTableView];
    }
     */

    [self scanButtonTapped:nil];

}

- (IBAction)scanButtonTapped:(id)sender 
{
    Reader = [[ZBarReaderViewController alloc]init];
    Reader.showsZBarControls = NO;
    
    
    UILabel *viewd = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    viewd.alpha = .5;
    viewd.text=@"请将摄像头对准积分卡条码";
    viewd.textAlignment=UITextAlignmentCenter;
    viewd.textColor=[UIColor whiteColor];
    viewd.font=[UIFont systemFontOfSize:16.0];
    viewd.backgroundColor=[UIColor blackColor];
    [Reader.view addSubview:viewd];
    
    
    UIButton *myCancelbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    myCancelbutton.frame = CGRectMake(10, 440, 64, 30);
    [myCancelbutton setBackgroundImage:[UIImage imageNamed:@"activate_cancel.png"] forState:UIControlStateNormal];
    [myCancelbutton addTarget:self action:@selector(activateCancel:) forControlEvents:UIControlEventTouchUpInside];
    myCancelbutton.backgroundColor = [UIColor clearColor];
    [Reader.view addSubview:myCancelbutton];
    
    
    UIButton *myInput_button = [UIButton buttonWithType:UIButtonTypeCustom];
    myInput_button.frame = CGRectMake(246, 440, 64, 30);
    [myInput_button setBackgroundImage:[UIImage imageNamed:@"activate_input.png"] forState:UIControlStateNormal];
    [myInput_button addTarget:self action:@selector(activateInput:) forControlEvents:UIControlEventTouchUpInside];
    myInput_button.backgroundColor = [UIColor clearColor];
    [Reader.view addSubview:myInput_button];
    
    
    
    Reader.readerDelegate = self;
    
    
    ZBarImageScanner *scanner = Reader.scanner;
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    [self presentModalViewController: Reader
                            animated: YES];
}

//二维码代理
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    id<NSFastEnumeration> results =
	[info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    
    //往数组末尾添加
    //    [reader_MutableArr addObject:symbol.data];
    
    activateNumber_lb.text = symbol.data;//扫描所得到的信息
    NSString *barcode_String = symbol.data;//扫描所得到的信息
    //扫描所得到的信息  

    
    NSMutableDictionary *jsonDic = [[NSMutableDictionary alloc]init];
    [jsonDic setObject:barcode_String forKey:@"integralCode"];//条形码
    
    NSMutableArray *tempArr = [[NSMutableArray alloc]init];
    [tempArr addObject:jsonDic];
//    [tempArr addObject:jsonDic];
    
    NSMutableDictionary *finDic = [[NSMutableDictionary alloc]init];
    [finDic setObject:tempArr forKey:@"integralCodeList"];
    [finDic setObject:@"354406040249527" forKey:@"mobileId"];
    
    
//    [jsonDic setObject:tempArr forKey:@"integralCode"];   
//    NSString *jsonString = [finDic JSONRepresentation];
//    NSString *arrayString = [tempArr JSONRepresentation];
//    NSLog(@"jsonString == %@,arrayString == %@",jsonString,arrayString);
    
    DataSource *dataSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic2 = response;
        NSLog(@"dic2dic =-----=  %@",dic2);
        

        
            
            
    } loadInfo:@"正在加载..." HUDBackView:self.view];
    [dataSource activateScoreintegralCodeList:tempArr mobileId:@"354406040249527"];
//    [dataSource activateScore:arrayString mobileId:@"354406040249527"];
    
    [self viewDidLoad];
//    [myTableView reloadData];
    [reader dismissModalViewControllerAnimated: YES];
    
}

//扫描取消按钮
- (void)activateCancel:(UIButton *)sender
{
    [Reader dismissModalViewControllerAnimated: YES];
    self.tabBarController.selectedIndex = 0;
}
//手动输入
- (void)activateInput:(UIButton *)sender
{
    [Reader dismissModalViewControllerAnimated: YES];
    InputPointsViewController *inputVC = [[InputPointsViewController alloc]init];
    [self.navigationController pushViewController:inputVC animated:YES];
}

- (IBAction)backHome_click:(id)sender 
{
    self.tabBarController.selectedIndex = 0; 

    //    [self.navigationController popToRootViewControllerAnimated:YES];
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
    return reader_MutableArr.count;
}
//单元格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: TableSampleIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    
    
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
    
    
    return cell;
}  

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
    

- (void)viewDidUnload
{
    myView = nil;
    activateNumber_lb = nil;
    activateResult_lb = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
