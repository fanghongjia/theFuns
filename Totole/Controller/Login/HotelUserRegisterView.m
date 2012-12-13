//
//  HotelUserRegisterView.m
//  Totole
//
//  Created by 王菲 on 12-11-28.
//
//

#import "HotelUserRegisterView.h"

@implementation HotelUserRegisterView
@synthesize childDelegate;
@synthesize provinceBtn,cityBtn,hotelTypeBtn,contactPostBtn;
@synthesize provinceId,cityId;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.userInteractionEnabled = YES;
        self.contentSize = CGSizeMake(300, 1250);
        UIImageView *rootView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300 ,538)];
        rootView.image = [UIImage imageNamed:@"hotelUserRegister.png"];
        rootView.userInteractionEnabled = YES;
        [self addSubview:rootView];
        
        provinceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        provinceBtn.frame = CGRectMake(110, 10, 80, 18);
        [provinceBtn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [provinceBtn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        [provinceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        provinceBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        provinceBtn.tag = 100;
        provinceBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [provinceBtn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [rootView addSubview:provinceBtn];
        
        
        cityBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        cityBtn.frame = CGRectMake(200, 10, 80, 18);
        [cityBtn setBackgroundImage:[UIImage imageNamed:@"register_DownLittleBox.png"] forState:UIControlStateNormal];
        [cityBtn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        [cityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cityBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        cityBtn.tag = 101;
        cityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [cityBtn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [rootView addSubview:cityBtn];
        
        
        
        hotelNameText = [[UITextField alloc]initWithFrame:CGRectMake(110, 48, 200, 31)];
        hotelNameText.backgroundColor = [UIColor clearColor];
        hotelNameText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:hotelNameText];
        
        userNameText = [[UITextField alloc]initWithFrame:CGRectMake(110, 86, 200, 31)];
        userNameText.backgroundColor = [UIColor clearColor];
        userNameText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:userNameText];
        
        
        passwordText = [[UITextField alloc]initWithFrame:CGRectMake(110, 126, 200, 31)];
        passwordText.backgroundColor = [UIColor clearColor];
        passwordText.font = [UIFont systemFontOfSize:14.0];
        passwordText.secureTextEntry = YES;
        passwordText.placeholder = @"6-20个英文字母,数字.下划线";
        [rootView addSubview:passwordText];
        
        comfrimPassText = [[UITextField alloc]initWithFrame:CGRectMake(110, 166, 200, 31)];
        comfrimPassText.backgroundColor = [UIColor clearColor];
        comfrimPassText.secureTextEntry = YES;
        comfrimPassText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:comfrimPassText];
        
        
        orderMobileText = [[UITextField alloc]initWithFrame:CGRectMake(110, 202, 200, 31)];
        orderMobileText.keyboardType = UIKeyboardTypeNumberPad;
        orderMobileText.backgroundColor = [UIColor clearColor];
        orderMobileText.font = [UIFont systemFontOfSize:14.0];
        orderMobileText.placeholder = @"订餐电话或手机号";
        [rootView addSubview:orderMobileText];
        
        addressText = [[UITextField alloc]initWithFrame:CGRectMake(110, 245, 200, 31)];
        addressText.backgroundColor = [UIColor clearColor];
        addressText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:addressText];
        
        hotelTypeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        hotelTypeBtn.frame =  CGRectMake(110, 283, 86, 18);         
        [hotelTypeBtn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [hotelTypeBtn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        [hotelTypeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        hotelTypeBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        hotelTypeBtn.tag = 102;
        hotelTypeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [hotelTypeBtn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [rootView addSubview:hotelTypeBtn];
        
        contactText = [[UITextField alloc]initWithFrame:CGRectMake(110, 318, 200, 31)];
        contactText.tag = 8;
        contactText.delegate = self;
        contactText.backgroundColor = [UIColor clearColor];
        contactText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:contactText];
        
        
        contactPostBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        contactPostBtn.frame =  CGRectMake(110, 360, 86, 18);
        [contactPostBtn setBackgroundImage:[UIImage imageNamed:@"register_DownBigBox.png"] forState:UIControlStateNormal];
        [contactPostBtn setTitle:@"--请选择--  " forState:UIControlStateNormal];
        [contactPostBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        contactPostBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        contactPostBtn.tag = 103;
        contactPostBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [contactPostBtn addTarget:self action:@selector(pickerViewSelect:) forControlEvents:UIControlEventTouchUpInside];
        [rootView addSubview:contactPostBtn];
        
        
        
        contactPhoneText = [[UITextField alloc]initWithFrame:CGRectMake(110, 397, 200, 31)];
        contactPhoneText.tag = 10;
        contactPhoneText.delegate = self;
        contactPhoneText.keyboardType = UIKeyboardTypeNumberPad;
        contactPhoneText.backgroundColor = [UIColor clearColor];
        contactPhoneText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:contactPhoneText];
        
        //邀请人ID
        invitePeopleText = [[UITextField alloc]initWithFrame:CGRectMake(110, 435, 200, 31)];
        invitePeopleText.tag = 11;
        invitePeopleText.delegate = self;
        invitePeopleText.keyboardType = UIKeyboardTypeNumberPad;
        invitePeopleText.backgroundColor = [UIColor clearColor];
        invitePeopleText.font = [UIFont systemFontOfSize:14.0];
        [rootView addSubview:invitePeopleText];
        
        
        
        
        
        
        UIButton *agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(68, 477, 10, 10)];
        [agreeBtn setBackgroundImage:[UIImage imageNamed:@"register_agree.png"] forState:UIControlStateNormal];
        [agreeBtn addTarget:self action:@selector(agreeMethod:) forControlEvents:UIControlEventTouchUpInside];
        [rootView addSubview:agreeBtn];
        
        
        UILabel *agreementLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 465, 200, 30)];
        agreementLab.text = @"同意《NTA饭店联盟协议》";
        agreementLab.font = [UIFont systemFontOfSize:14];
        agreementLab.textAlignment = UITextAlignmentLeft;
        agreementLab.textColor = [UIColor brownColor];
        [rootView addSubview:agreementLab];
        
        
        UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 494, 80, 35)];
        [registerBtn setBackgroundImage:[UIImage imageNamed:@"register_register.png"] forState:UIControlStateNormal];
        [registerBtn addTarget:self action:@selector(registerEvent:) forControlEvents:UIControlEventTouchUpInside];
        [rootView addSubview:registerBtn];
        
    }
    return self;
}


-(void)pickerViewSelect:(UIButton *)sender
{
    [self.childDelegate selectedControlFromPickView:self indexAtControl:sender.tag];
}
#pragma mark-
#pragma mark UITextFieldDelegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
    [UIView setAnimationDuration:.3f];
    float width = 320;//self.frame.size.width;
    float height = 460;//self.frame.size.height;
    
    if (textField.tag == 10) 
    {
        CGRect rect = CGRectMake(0.0f, -130, width, height);
        self.superview.frame= rect;
    }
    else if (textField.tag == 8) 
    {
        CGRect rect = CGRectMake(0.0f, -60, width, height);
        self.superview.frame= rect;
    }
    else if (textField.tag == 11) 
    {
        CGRect rect = CGRectMake(0.0f, -225, width, height);
        self.superview.frame= rect;
    }

    
    [UIView commitAnimations];
    
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.tag == 10 || textField.tag == 8 ||textField.tag == 11) 
    {
        for(UIView*view in self.subviews) 
        {
            [view resignFirstResponder];            
            [UIView beginAnimations:@"ResizeForKeyboard"context:nil];
            [UIView setAnimationDuration:.3f];
            float width = 320;//self.frame.size.width;
            float height = 460;//self.frame.size.height;
            CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
            self.superview.frame= rect;
            
            [UIView commitAnimations];
        }
    }
    
    return YES;
}


#pragma mark agreeMethod
-(void)agreeMethod:(UIButton *)sender
{
    if (isAgree == YES)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"register_disagree.png"] forState:UIControlStateNormal];
        isAgree = NO;
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"register_agree.png"] forState:UIControlStateNormal];
        isAgree = YES;
    }
    
}

#pragma mark registerEvent
-(void)registerEvent:(UIButton *)sender
{
//    if ([hotelNameText.text isEqualToString:@""]) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"饭店名称不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if ([userNameText.text isEqualToString:@""]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户名不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if ([passwordText.text isEqualToString:@""]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"密码不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if (![comfrimPassText.text isEqualToString:passwordText.text]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"两次密码输入不一致!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if ([orderMobileText.text isEqualToString:@""]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"订餐电话不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if ([addressText.text isEqualToString:@""]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"地址不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if ([contactText.text isEqualToString:@""]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"联系人不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }else if ([contactPhoneText.text isEqualToString:@""]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"联系人手机不能为空!" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//        return;
//    }
//    else
//    {
    NSLog(@"provinceId ==%@",provinceId);
    NSLog(@"cityId ==%@",cityId);
    
        DataSource *dataSource = [DataSource interFaceWithBlocks:^(id response) {
            NSDictionary *diction = [response objectForKey:@"output"];
            NSLog(@"dcition == %@",diction);
            
        } loadInfo:@"正在加载..." HUDBackView:self];
        [dataSource registeruser_province:provinceId city:cityId restaurantName:hotelNameText.text userName:userNameText.text password:passwordText.text reservationTel:orderMobileText.text address:addressText.text restaurantType:hotelTypeBtn.titleLabel.text contact:contactText.text contactPosition:contactPostBtn.titleLabel.text contactMobile:contactPhoneText.text inviteCode:invitePeopleText.text]; 
//    }
}





@end
