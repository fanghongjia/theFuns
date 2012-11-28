//
//  RegisterViewController.m
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    
    province_Mutable = [NSMutableArray arrayWithObjects:@"四川",@"重庆",@"甘肃",@"青海",@"贵州",@"云南",@"北京",@"上海",@"天津",@"河北",@"山西",@"内蒙古",@"辽宁",@"吉林",@"黑龙江",@"江苏",@"浙江",@"安徽",@"福建",@"江西",@"山东",@"河南",@"湖北",@"湖南",@"广东",@"广西",@"海南",@"西藏",@"陕西",@"宁夏",@"新疆",nil];
    hotelType_Mutable = [NSMutableArray arrayWithObjects:@"三星级",@"四星级",@"五星级", nil];
    post_Mutable = [NSMutableArray arrayWithObjects:@"经理",@"厨师长",@"配菜", nil];
    self.navigationController.navigationBarHidden = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    hotelUserView = [[HotelUserRegisterView alloc] initWithFrame:CGRectMake(10, 80,300 ,1075)];
//    hotelUserView.contentSize = CGSizeMake(300, 1380);
    hotelUserView.childDelegate = self;
    [self.view addSubview:hotelUserView];
    
    hotel_array = [[NSArray alloc]initWithObjects:@"省/市:",@"饭店名称:",@"用户名:",@"密码:",@"确认密码:",@"订餐电话:",@"地址:",@"饭店类型:",@"联系人:",@"联系人职务:",@"联系人手机:",@"邀请人ID:", nil];
    
    agree = YES;
    hotelRegister = YES;
}

- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender
{
    UIWindow * keyWindow=[[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
}


// 注册，选中饭店or厨师
- (IBAction)registerSelect_click:(id)sender 
{
    if (sender == hotelRegister_btn ) 
    {
        hotelUserView.hidden = NO;
        cookPersonalView.hidden = YES;
        [hotelRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_HotelSelect.png"] forState:UIControlStateNormal];
        [cookRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_cookNomal.png"] forState:UIControlStateNormal];
        hotelRegister = YES;
    }
    else 
    {
         


        hotelUserView.hidden = YES;
        if (cookPersonalView) 
        {
            cookPersonalView.hidden = NO;
        } 
        else 
        {
            //480-72
            cookPersonalView = [[CookPersonal_view alloc]init];
            cookPersonalView.frame = CGRectMake(10, 72, 300, 408);
            cookPersonalView.layer.cornerRadius = 10.0;
            cookPersonalView.layer.masksToBounds = YES;
            
//            cookPersonal_TableView = [[CookPersonal_TableView alloc]initWithFrame:CGRectMake(10, 100, 300, 310) style:UITableViewStylePlain];
            [self.view addSubview:cookPersonalView];
        }
        
        [hotelRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_HotelNomal.png"] forState:UIControlStateNormal];
        [cookRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_cookSelect.png"] forState:UIControlStateNormal];
        hotelRegister = NO;
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
    if (pickerView == province_PickView) 
    {
        return province_Mutable.count;
    }
    else if (pickerView == city_PickView) 
    {
        return city_Mutable.count;
    }
    else if (pickerView == hotelType_PickView) 
    {
        return hotelType_Mutable.count;
    }
    else 
    {
        return post_Mutable.count;
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == province_PickView) 
    {
        return [province_Mutable objectAtIndex:row];
    }
    else if (pickerView == city_PickView) 
    {
        return [city_Mutable objectAtIndex:row];
    }
    else if (pickerView == hotelType_PickView) 
    {
        return [hotelType_Mutable objectAtIndex:row];
    }
    else 
    {
        return [post_Mutable objectAtIndex:row];
    }
}


-(void)pickerViewSelect:(UIButton *)sender
{
    if (sender == province_btn) 
    {
        [province_PickView reloadAllComponents];
        [self.view bringSubviewToFront:province_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = NO;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }
    else if (sender == city_btn) 
    {
        [city_PickView reloadAllComponents];
        [self.view bringSubviewToFront:city_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = NO;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }
    else if (sender == hotelType_btn) 
    {
        [hotelType_PickView reloadAllComponents];
        [self.view bringSubviewToFront:hotelType_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = NO;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }
    else 
    {
        [post_PickView reloadAllComponents];
        [self.view bringSubviewToFront:post_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = NO;
        toolbar.hidden = NO;
    }
    
}


-(void)selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index{
    if (index == 100) {
        [province_PickView reloadAllComponents];
        [self.view bringSubviewToFront:province_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = NO;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }else if (index == 101){
        [city_PickView reloadAllComponents];
        [self.view bringSubviewToFront:city_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = NO;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }else if (index == 102){
        [hotelType_PickView reloadAllComponents];
        [self.view bringSubviewToFront:hotelType_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = NO;
        post_PickView.hidden = YES;
        toolbar.hidden = NO;
    }else if(index == 103){
        [post_PickView reloadAllComponents];
        [self.view bringSubviewToFront:post_PickView];
        [self.view bringSubviewToFront:toolbar];
        province_PickView.hidden = YES;
        city_PickView.hidden = YES;
        hotelType_PickView.hidden = YES;
        post_PickView.hidden = NO;
        toolbar.hidden = NO;
    }
}
//确定按钮
- (IBAction)infoSelect_click:(id)sender 
{ 
    int province_selectedRow = [province_PickView  selectedRowInComponent:0 ];
    int city_selectedRow = [city_PickView  selectedRowInComponent:0 ];
    int hotelType_selectedRow = [hotelType_PickView  selectedRowInComponent:0 ];
    int post_selectedRow = [post_PickView  selectedRowInComponent:0 ];
    
    province_PickView.hidden = YES;
    city_PickView.hidden = YES;
    toolbar.hidden = YES;
    hotelType_PickView.hidden = YES;
    post_PickView.hidden = YES;
    
//    province_btn.titleLabel.text = [province_Mutable objectAtIndex:province_selectedRow]; 
//    city_btn.titleLabel.text = [city_Mutable objectAtIndex:city_selectedRow];        
//    hotelType_btn.titleLabel.text = [hotelType_Mutable objectAtIndex:hotelType_selectedRow]; 
//    post_btn.titleLabel.text = [post_Mutable objectAtIndex:post_selectedRow];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    city_Mutable = [[[NSMutableArray alloc] initWithContentsOfFile:path] objectAtIndex:province_selectedRow];
    
    hotelUserView.provinceBtn.titleLabel.text = [province_Mutable objectAtIndex:province_selectedRow];
    hotelUserView.cityBtn.titleLabel.text = [city_Mutable objectAtIndex:city_selectedRow];
    hotelUserView.hotelTypeBtn.titleLabel.text = [hotelType_Mutable objectAtIndex:hotelType_selectedRow];
    hotelUserView.contactPostBtn.titleLabel.text = [post_Mutable objectAtIndex:post_selectedRow];
}

#pragma mark-
#pragma mark UITextFieldDelegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
       
    [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
    [UIView setAnimationDuration:.3f];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;

    if (textField.tag == 10) 
    {
        textField.keyboardType = UIKeyboardTypeNumberPad;
        CGRect rect = CGRectMake(0.0f, -130, width, height);
        self.view.frame= rect;
    }
    else if (textField.tag == 8) 
    {
        CGRect rect = CGRectMake(0.0f, -60, width, height);
        self.view.frame= rect;
    }
    else if (textField.tag == 11) 
    {
        CGRect rect = CGRectMake(0.0f, -225, width, height);
        self.view.frame= rect;
    }
    else if(textField.tag == 5 || textField.tag == 12)
    {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
        
    [UIView commitAnimations];
    

    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.tag == 10 || textField.tag == 8 ||textField.tag == 11) 
    {
        for(UIView*view in self.view.subviews) 
        {
            [view resignFirstResponder];            
            [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
            [UIView setAnimationDuration:.3f];
            float width = self.view.frame.size.width;
            float height = self.view.frame.size.height;
            CGRect rect = CGRectMake(0.0f, .0f, width, height);
            self.view.frame= rect;
            
            [UIView commitAnimations];
        }
    }
      
    return YES;
}




#pragma mark-
#pragma mark 注册


- (IBAction)back_click:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    province_PickView = nil;
    toolbar = nil;
    city_PickView = nil;
    hotelType_PickView = nil;
    post_PickView = nil;
    hotelRegister_btn = nil;
    cookRegister_btn = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
