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
    
    
    
    //判断是否记住密码
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *account = [defaults objectForKey:@"account"];
    NSString *passWord = [defaults objectForKey:@"passWord"];
    if (!account.length == 0 && !passWord.length == 0) 
    {
        account_TF.text = account;
        password_TF.text = passWord;
    }
    
    
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
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        //登录成功之后保存账户和密码--------需要修改保存内容-------------------
        NSMutableArray *save_mutableArray = [defaults objectForKey:@"Info_mutabArray"];
        NSLog(@"save_mutableArray == %@",save_mutableArray);
        
        
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
                                      password_TF.text,nil,nil];
        }
        
        
        //判断数组里面的个数是否大于5，把字典加入数组里
        NSLog(@"save_mutableArray.count == %d",save_mutableArray.count);
        NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithArray:save_mutableArray];
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
        
        if (rememberPassword == YES) 
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:account_TF.text forKey:@"account"];
            [defaults setValue:password_TF.text forKey:@"passWord"];
        }
        //回调，判断是厨师登录还是饭店登录
        //选中饭店
        if (hotel == YES) 
        {
            [(AppDelegate*)[UIApplication sharedApplication].delegate initTabBarControl:1];
        }
        else //选中厨师
        {
            [(AppDelegate*)[UIApplication sharedApplication].delegate initTabBarControl:2];
        }
    }
   
    
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
