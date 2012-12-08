//
//  LoginViewController.m
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    //点击空白出 键盘消失
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //登录成功之后保存账户和密码--------需要修改保存内容-------------------
    save_mutableArray = [defaults objectForKey:@"Info_mutabArray"];
    NSLog(@"save_mutableArray == %@",save_mutableArray);
    
    //判断是否记住密码
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *account = [defaults objectForKey:@"account"];
//    NSString *passWord = [defaults objectForKey:@"passWord"];
//    if (!account.length == 0 && !passWord.length == 0) 
//    {
//        account_TF.text = account;
//        password_TF.text = passWord;
//    }
    
    
    self.navigationController.navigationBarHidden = YES;
    UITapGestureRecognizer*tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self 
                                                                                  action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView= NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    hotel = YES;
    rememberPassword = YES;
}
//隐藏键盘
- (void) handleBackgroundTap:(UITapGestureRecognizer *)sender
{
    UIWindow* keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}
#pragma mark-
#pragma mark 饭店厨师选择
//饭店厨师选择
- (IBAction)hotelORcook_click:(id)sender 
{
    if (sender == hotel_btn) 
    {
        [hotel_btn setBackgroundImage:[UIImage imageNamed:@"login_selectIn.png"] forState:UIControlStateNormal];
        [cook_btn setBackgroundImage:[UIImage imageNamed:@"login_selectOut.png"] forState:UIControlStateNormal];
        hotel = YES;       
    }
    else 
    {
        [hotel_btn setBackgroundImage:[UIImage imageNamed:@"login_selectOut.png"] forState:UIControlStateNormal];
        [cook_btn setBackgroundImage:[UIImage imageNamed:@"login_selectIn.png"] forState:UIControlStateNormal];
        hotel = NO;
    }
}

- (IBAction)showPickView_click:(id)sender 
{
    toolbar.hidden = NO;
    myPickerView.hidden = NO;
}
#pragma mark-
#pragma mark 登录
//登录
- (IBAction)login_click:(id)sender 
{
    if (account_TF.text.length == 0 || password_TF.text.length == 0) 
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"系统提示" 
                                                       message:@"请把账号和密码输入完整！" 
                                                      delegate:nil 
                                             cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else 
    {
        
        
        DataSource *dataSource = [DataSource interFaceWithBlocks:^(id response) {
            NSDictionary *dic2 = response;
            NSLog(@"dic2dic2dic2 ==  %@",dic2);
            
            NSMutableArray *cookes = [[NSMutableArray alloc]initWithArray:[dic2 objectForKey:@"cookies"]];
            
            //NSHTTPCookie *cooke=[cookes objectAtIndex:0];            
//            NSDictionary *dictd=[NSHTTPCookie requestHeaderFieldsWithCookies:cookes];            
//            NSLog(@"dictd:%@",dictd);
            
            mainDelegate = MYDELEGATE;
            mainDelegate.myCookie = cookes;//[dictd objectForKey:@"Cookie"];
            [cookes release];
//            [[NSUserDefaults standardUserDefaults] setObject:cookie forKey:@"cookie"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

            NSString *sessionId_string;
            sessionId_string = [[dic2 objectForKey:@"output"]objectForKey:@"sessionId"];

            [defaults setObject:sessionId_string forKey:@"sessionId"];

            NSLog(@"sessionId_string == %@",sessionId_string);
        
        
//            NSArray *tempArray = [[[dic2  objectForKey:@"output"] objectForKey:@"provinces"] JSONValue];
            
             NSLog(@"account_TF.text =--= %@ password_TF.text =---= %@",account_TF.text,password_TF.text);
                        
        } loadInfo:@"正在加载..." HUDBackView:self.view];
        [dataSource login:account_TF.text passwrod:password_TF.text userType:@"1" operateSource:@"2" mobileId:@"354406040249527"];
    
         
        //ASIHTTPRequest setSessionCookies:(NSMutableArray *)
        
        
        
        /*
        NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
        [mDict setObject:account_TF.text forKey:@"userName"];
        [mDict setObject:password_TF.text forKey:@"password"];
        [mDict setObject:@"1" forKey:@"userType"];
        [mDict setObject:@"2" forKey:@"operateSource"];
        [mDict setObject:@"354406040249527" forKey:@"mobileId"];
        
        
        
		NSString *JSONString = [mDict JSONRepresentation];
		NSLog(@" JSON :Format %@", [JSONString description]);
		

        NSURL *url= [NSURL URLWithString:@"http://61.172.246.12:8383/webservice/ws/userService/login"];
        
		NSData *postData = [JSONString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
		
		NSLog(@"postData : %@", postData);
		NSString *postLength = [NSString stringWithFormat:@"%d", [JSONString length]];
        NSMutableURLRequest*requestPOST = [[NSMutableURLRequest alloc] initWithURL:url];
        //		NSMutableURLRequest*requestPOST = [[[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20] autorelease];
		//[requestPOST setURL:url]; 
		[requestPOST setHTTPMethod:@"POST"];
        //[requestPOST setHTTPShouldUsePipelining:NO];
		[requestPOST setValue:postLength forHTTPHeaderField:@"Content-Length"];
		[requestPOST setValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
		[requestPOST setHTTPBody:postData];
        
        //		NSURLResponse*response= nil;
        
		NSError *error = nil;
        NSString *returnString ;
        NSData *returnData = [NSURLConnection sendSynchronousRequest:requestPOST returningResponse:nil error:&error];
        if (error) {
            NSLog(@"error == %@",error);
        }else{
            
            returnString= [[NSString alloc] initWithBytes:returnData.bytes length:returnData.length encoding:NSUTF8StringEncoding];
            NSLog(@"返回 == %@",returnString);
        }
        */
         
         
        
        
        
        
        //先调用接口，判断是否登录成功-------------------------
//        DataSource *dataSource = [DataSource interFaceWithBlocks:^(id response) {
//            NSDictionary *diction = [response objectForKey:@"output"];
//            NSLog(@"dcition == %@",diction);
//            
//        } loadInfo:@"正在加载..." HUDBackView:self.view];
//        [dataSource login:account_TF.text passwrod:password_TF.text userType:@"2"];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        //登录成功之后保存账户和密码--------需要修改保存内容-------------------
//        save_mutableArray = [defaults objectForKey:@"Info_mutabArray"];
//        NSLog(@"save_mutableArray == %@",save_mutableArray);
        

        //判断数组里面的个数是否大于5，把字典加入数组里
        NSLog(@"save_mutableArray.count == %d",save_mutableArray.count);

        NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:save_mutableArray];
        
        
        //判断已存入本地字典的账号和登录的账号是否相同
        for (int i = 0; i<mutableArray.count; i++) 
        {
            NSString *account_string = [[mutableArray objectAtIndex:i]objectForKey:@"account"];
            if ([account_string isEqualToString:account_TF.text]) 
            {
                Equal = YES;
            }
            else 
            {
                
            }
        }
        //如果和保存中的都不同的话
        if (!Equal == YES) 
        {
            //用户名和密码保存到字典里,先判断是否保存密码
            if (rememberPassword == YES) 
            {
                accountInfo_mutableDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          account_TF.text, @"account",
                                          password_TF.text,@"password",nil];
            }
            else 
            {
                accountInfo_mutableDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          account_TF.text, @"account",
                                          @"",@"password",nil];
            }
            
            if (mutableArray.count < 5) 
            {
                [mutableArray insertObject:accountInfo_mutableDic atIndex:0];
            }
            else 
            {
                [mutableArray removeObjectAtIndex:4];
                [mutableArray insertObject:accountInfo_mutableDic atIndex:0];
            }
            [defaults setValue:mutableArray forKey:@"Info_mutabArray"];
            NSLog(@"mutableArray == %@,accountInfo_mutableDic == %@",mutableArray,accountInfo_mutableDic);

        }
        
        
        //保留这次登录的账号和密码，后面肯定要用到        

        [defaults setValue:account_TF.text forKey:@"account"];
        [defaults setValue:password_TF.text forKey:@"passWord"];
        NSLog(@"account_TF.text == %@ password_TF.text == %@",account_TF.text,password_TF.text);
        
        //回调，判断是厨师登录还是饭店登录
        //选中饭店
        if (hotel == YES) 
        {
            [(AppDelegate*)[UIApplication sharedApplication].delegate initTabBarControl:LoginType_hotel];
        }
        else //选中厨师
        {
            [(AppDelegate*)[UIApplication sharedApplication].delegate initTabBarControl:LoginType_cook];
        }
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
    NSLog(@"save_mutableArray =--- %@",save_mutableArray);

    return save_mutableArray.count;
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //    NSLog(@"areaid_array =--- %@",areaid_array);
    return [[save_mutableArray objectAtIndex:row]objectForKey:@"account"];
    
}

- (IBAction)selectAccount_click:(id)sender 
{
    int selectedRow = [ myPickerView  selectedRowInComponent:0 ];
    NSLog(@"selectedRow==%d",selectedRow);
    
    
    NSString *string = [[save_mutableArray objectAtIndex:selectedRow]objectForKey:@"account"];
    account_TF.text = string;
    password_TF.text = [[save_mutableArray objectAtIndex:selectedRow]objectForKey:@"password"];
    toolbar.hidden = YES;
    myPickerView.hidden = YES;
}
#pragma mark-
#pragma mark 重置
//重置
- (IBAction)reset_click:(id)sender 
{
    account_TF.text = nil;
    password_TF.text = nil;
}
#pragma mark-
#pragma mark 记住密码
//记住密码
- (IBAction)rememberPassword_click:(id)sender 
{
    if (rememberPassword == YES) 
    {
        [rememberPassword_btn setBackgroundImage:[UIImage imageNamed:@"login_RememberOut.png"] forState:UIControlStateNormal];
        rememberPassword = NO;
    }
    else 
    {
        [rememberPassword_btn setBackgroundImage:[UIImage imageNamed:@"login_Remember me.png"] forState:UIControlStateNormal];
        rememberPassword = YES;
    }
}
#pragma mark-
#pragma mark 注册
//注册
- (IBAction)register_click:(id)sender 
{
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
}
#pragma mark-
#pragma mark 忘记密码
//忘记密码
- (IBAction)forgotPassword_click:(id)sender 
{
    ForgotPasswordViewController *forgotPasswordVC = [[ForgotPasswordViewController alloc]init];
    [self.navigationController pushViewController:forgotPasswordVC animated:YES];
}

- (void)viewDidUnload
{
    hotel_btn = nil;
    cook_btn = nil;
    account_TF = nil;
    password_TF = nil;
    rememberPassword_btn = nil;
    toolbar = nil;
    myPickerView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
