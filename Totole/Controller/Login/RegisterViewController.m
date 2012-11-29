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
    
//    province_Mutable = [NSMutableArray arrayWithObjects:@"四川",@"重庆",@"甘肃",@"青海",@"贵州",@"云南",@"北京",@"上海",@"天津",@"河北",@"山西",@"内蒙古",@"辽宁",@"吉林",@"黑龙江",@"江苏",@"浙江",@"安徽",@"福建",@"江西",@"山东",@"河南",@"湖北",@"湖南",@"广东",@"广西",@"海南",@"西藏",@"陕西",@"宁夏",@"新疆",nil];
//    hotelType_Mutable = [NSMutableArray arrayWithObjects:@"三星级",@"四星级",@"五星级", nil];
//    post_Mutable = [NSMutableArray arrayWithObjects:@"经理",@"厨师长",@"配菜", nil];
    self.navigationController.navigationBarHidden = YES;
    city_Mutable =[[NSMutableArray alloc] init];
    cityIDArray = [[NSMutableArray alloc] init];
    
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    NSString *recordDateStr = [uDefault objectForKey:@"recordDate"];
    if (recordDateStr) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSLocale *locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [dateFormatter setLocale:locale];
        NSDate *currentDate = [NSDate date];
        NSString *dateStr = [dateFormatter stringFromDate:currentDate];
        NSLog(@"dateStr == %@",dateStr);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:-7];
        NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *mDate = [calender dateByAddingComponents:comps toDate:currentDate options:1];
        NSString *lastWeek = [dateFormatter stringFromDate:mDate];
        NSLog(@"lastWeek == %@",lastWeek);
        
        NSDate *recordDate = [dateFormatter dateFromString:recordDateStr];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"provinceCity.plist"];
        NSFileManager *myFM = [NSFileManager defaultManager];
        switch ([recordDate compare:mDate]) {
            case NSOrderedSame:{
                if([myFM fileExistsAtPath:savedImagePath]){
                    province_Mutable  = [[ NSMutableArray alloc ] initWithContentsOfFile:savedImagePath];
                    city_Mutable  = [[province_Mutable objectAtIndex:0] objectForKey:@"city"];
                }
            }
                break;
            case NSOrderedAscending:{
                if([myFM fileExistsAtPath:savedImagePath]){
                    province_Mutable  = [[ NSMutableArray alloc ] initWithContentsOfFile:savedImagePath];
                    city_Mutable  = [[province_Mutable objectAtIndex:0] objectForKey:@"city"];
                }
            }
                break;
            case NSOrderedDescending:{
                DataSource *dataSourc = [DataSource interFaceWithBlocks:^(id response) {
                    NSDictionary *dic2 = response;
                    NSArray *tempArray = [[[dic2  objectForKey:@"output"] objectForKey:@"provinces"] JSONValue];
                    
                    if([myFM fileExistsAtPath:savedImagePath]){
                        [myFM removeItemAtPath:savedImagePath error:nil];
                    }
                    
                    NSMutableArray *provinceArray = [[NSMutableArray alloc] init];
                    
                    for (int i=0; i<[tempArray count]; i++) {
                        NSMutableDictionary *mdiction = [[NSMutableDictionary alloc] init];
                        NSArray *citytempArr = [[[tempArray objectAtIndex:i] objectForKey:@"cityList"] JSONValue];
                        [mdiction setObject:[NSString stringWithFormat:@"%@",[[tempArray objectAtIndex:i] objectForKey:@"provinceId"]] forKey:@"provinceId"];
                        [mdiction setObject:[[tempArray objectAtIndex:i] objectForKey:@"provinceName"] forKey:@"provinceName"];
                        NSMutableArray *cityArrary = [[NSMutableArray alloc] init];
                        for (int j= 0; j<[citytempArr count]; j++) {
                            NSMutableDictionary *mdic = [[NSMutableDictionary alloc] init];
                            [mdic setObject:[NSString stringWithFormat:@"%@",[[citytempArr objectAtIndex:j] objectForKey:@"cityId"]] forKey:@"cityId"];
                            [mdic setObject:[[citytempArr objectAtIndex:j] objectForKey:@"cityName"] forKey:@"cityName"];
                            [cityArrary addObject:mdic];
                        }
                        [mdiction setObject:cityArrary forKey:@"city"];
                        [provinceArray addObject:mdiction];                        
                    }
                    [provinceArray writeToFile:savedImagePath atomically:YES];
                    
                    province_Mutable  = [[ NSMutableArray alloc ] initWithContentsOfFile:savedImagePath];
                    
                    NSArray *cityTemp = [[province_Mutable objectAtIndex:0] objectForKey:@"city"];
                    
                    NSLog(@"cityTemp ===%@",cityTemp);
                    for (int x = 0; x <[cityTemp count]; x++) {
                        [city_Mutable addObject: [[cityTemp objectAtIndex:x] objectForKey:@"cityName"]];
                        [cityIDArray addObject:[[cityTemp objectAtIndex:x] objectForKey:@"cityId"]];
                    }
                    
                } loadInfo:@"正在加载..." HUDBackView:self.view];
                [dataSourc getProvincesAndCities];
            }
                break;
            default:
                break;
        }
    }else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSLocale *locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [dateFormatter setLocale:locale];
        NSDate *currentDate = [NSDate date];
        NSString *dateStr = [dateFormatter stringFromDate:currentDate];
        [uDefault setObject:dateStr forKey:@"recordDate"];
        [uDefault synchronize];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"provinceCity.plist"];
        NSFileManager *myFM2 = [NSFileManager defaultManager];
        DataSource *dataSourc = [DataSource interFaceWithBlocks:^(id response) {
            NSDictionary *dic2 = response;
            NSArray *tempArray = [[[dic2  objectForKey:@"output"] objectForKey:@"provinces"] JSONValue];
            
            if([myFM2 fileExistsAtPath:savedImagePath]){
                [myFM2 removeItemAtPath:savedImagePath error:nil];
            }
            
            NSMutableArray *provinceArray = [[NSMutableArray alloc] init];
            
            for (int i=0; i<[tempArray count]; i++) {
                NSMutableDictionary *mdiction = [[NSMutableDictionary alloc] init];
                NSArray *citytempArr = [[[tempArray objectAtIndex:i] objectForKey:@"cityList"] JSONValue];
                [mdiction setObject:[NSString stringWithFormat:@"%@",[[tempArray objectAtIndex:i] objectForKey:@"provinceId"]] forKey:@"provinceId"];
                [mdiction setObject:[[tempArray objectAtIndex:i] objectForKey:@"provinceName"] forKey:@"provinceName"];
                NSMutableArray *cityArrary = [[NSMutableArray alloc] init];
                for (int j= 0; j<[citytempArr count]; j++) {
                    NSMutableDictionary *mdic = [[NSMutableDictionary alloc] init];
                    [mdic setObject:[NSString stringWithFormat:@"%@",[[citytempArr objectAtIndex:j] objectForKey:@"cityId"]] forKey:@"cityId"];
                    [mdic setObject:[[citytempArr objectAtIndex:j] objectForKey:@"cityName"] forKey:@"cityName"];
                    [cityArrary addObject:mdic];
                }
                [mdiction setObject:cityArrary forKey:@"city"];
                [provinceArray addObject:mdiction];
            }
            [provinceArray writeToFile:savedImagePath atomically:YES];
            
            
            province_Mutable  = [[ NSMutableArray alloc ] initWithContentsOfFile:savedImagePath];
            NSArray *cityTemp = [[province_Mutable objectAtIndex:0] objectForKey:@"city"];
            NSLog(@"cityTemp ===%@",cityTemp);
            for (int x = 0; x <[cityTemp count]; x++) {
                [cityIDArray addObject:[[cityTemp objectAtIndex:x] objectForKey:@"cityId"]];
                [city_Mutable addObject: [[cityTemp objectAtIndex:x] objectForKey:@"cityName"]];
            }
            
            
        } loadInfo:@"正在加载..." HUDBackView:self.view];
        [dataSourc getProvincesAndCities];
        
        
    }
    
    
    DataSource *daSource = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic3 = response;
        NSArray *tempArr = [[[dic3 objectForKey:@"output"] objectForKey:@"resTypes"] JSONValue];
        hotelType_Mutable = [NSArray arrayWithArray:tempArr];
        for (int i=0; i<[tempArr count]; i++) {
            
            NSLog(@"resTypeId[%i]====%@",i,[[tempArr objectAtIndex:i] objectForKey:@"resTypeId"]);
            NSLog(@"resTypeName[%i]====%@",i,[[tempArr objectAtIndex:i] objectForKey:@"resTypeName"]);
        }
        
    } loadInfo:@"正在加载..." HUDBackView:self.view];
    [daSource getResTypes];
    
    
    
    
    DataSource *daSources = [DataSource interFaceWithBlocks:^(id response) {
        NSDictionary *dic4 = response;
        NSArray *tempArr2 = [[[dic4 objectForKey:@"output"] objectForKey:@"positions"] JSONValue];
        post_Mutable = [NSArray arrayWithArray:tempArr2];
        for (int i=0; i<[tempArr2 count]; i++) {
            NSLog(@"positionId[%i]====%@",i,[[tempArr2 objectAtIndex:i] objectForKey:@"positionId"]);
            NSLog(@"positionName[%i]====%@",i,[[tempArr2 objectAtIndex:i] objectForKey:@"positionName"]);
        }
        
    } loadInfo:@"正在加载..." HUDBackView:self.view];
    [daSources getPositions];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    hotelUserView = [[HotelUserRegisterView alloc] initWithFrame:CGRectMake(10, 80,300 ,1075)];
//    hotelUserView.contentSize = CGSizeMake(300, 1380);
    hotelUserView.childDelegate = self;
    hotelUserView.hidden = NO;
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
        cookHotel.hidden = YES;
        
        [hotelRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_HotelSelect.png"] forState:UIControlStateNormal];
        [cookRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_cookNomal.png"] forState:UIControlStateNormal];
        hotelRegister = YES;
    }
    else 
    {

        hotelUserView.hidden = YES;
        
        if (cookHotel) 
        {
            cookPersonalView.hidden = YES;
            cookHotel.hidden = NO;
        }
        else 
        {
            if (cookPersonalView) 
            {
                cookPersonalView.hidden = NO;
            }
            else 
            {
                cookPersonalView = [[CookPersonal_view alloc]init];
                cookPersonalView.CookPersonal_viewDelegate = self;
                cookPersonalView.frame = CGRectMake(10, 72, 300, 408);
                cookPersonalView.layer.cornerRadius = 10.0;
                cookPersonalView.layer.masksToBounds = YES;
                
                [self.view addSubview:cookPersonalView];
            }
            
        }

        
        [hotelRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_HotelNomal.png"] forState:UIControlStateNormal];
        [cookRegister_btn setBackgroundImage:[UIImage imageNamed:@"register_cookSelect.png"] forState:UIControlStateNormal];
        hotelRegister = NO;
    }
}


#pragma mark - 
#pragma mark Picker DataSource Methods

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == province_PickView)
    {
        if (city_Mutable && [city_Mutable count]>0) {
            [city_Mutable removeAllObjects];
        }
        NSArray *tempArr = [[province_Mutable objectAtIndex:row] objectForKey:@"city"];
        for (int iii =0; iii <[tempArr count]; iii++) {
            [city_Mutable addObject:[[tempArr objectAtIndex:iii] objectForKey:@"cityName"]];
            [cityIDArray addObject:[[tempArr objectAtIndex:iii] objectForKey:@"cityId"]];
        }
    }
    
}

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
        return [[province_Mutable objectAtIndex:row] objectForKey:@"provinceName"];
    }
    else if (pickerView == city_PickView)
    {
        return  [city_Mutable objectAtIndex:row];
    }
    else if (pickerView == hotelType_PickView) 
    {
        return [[hotelType_Mutable objectAtIndex:row] objectForKey:@"resTypeName"];
    }
    else 
    {
        return [[post_Mutable objectAtIndex:row] objectForKey:@"positionName"];
    }
}

#pragma mark - 
#pragma mark CookHotel_View Delgtate Methods
-(void)cookHotel_selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index
{
    if (index == 10) 
    {
        ;
    }
    else if (index == 11) 
    {
        ;
    }
}


#pragma mark - 
#pragma mark CookPersonal_View Delgtate Methods
-(void)nextStepRegister:(UIView *)view diction:(NSDictionary *)diction
{
    cookPersonalView.hidden = YES;
    cookHotel = [[CookHotel_View alloc]initWithFrame:CGRectMake(10, 72, 300, 408)];
    [self.view addSubview:cookHotel];
}

// 厨师注册代理方法
-(void)cook_selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index
{
    if (index == 1000) 
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
    else if (index == 1001) 
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



#pragma mark - 
#pragma mark HotelUserRegisterView Delgtate Methods
//饭店注册代理方法
-(void)selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index
{
    if (index == 100) 
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
    else if (index == 101)
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
    else if (index == 102)
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
    else if(index == 103)
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
    

//    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
//    city_Mutable = [[[NSMutableArray alloc] initWithContentsOfFile:path] objectAtIndex:province_selectedRow];
    
    if (hotelUserView.hidden == NO) 
    {
        hotelUserView.provinceBtn.titleLabel.text = [[province_Mutable objectAtIndex:province_selectedRow] objectForKey:@"provinceName"];
        hotelUserView.provinceId = [[province_Mutable objectAtIndex:province_selectedRow] objectForKey:@"provinceId"];
        hotelUserView.cityBtn.titleLabel.text = [city_Mutable objectAtIndex:city_selectedRow];
        hotelUserView.cityId = [cityIDArray objectAtIndex:city_selectedRow];
        hotelUserView.hotelTypeBtn.titleLabel.text = [[hotelType_Mutable objectAtIndex:hotelType_selectedRow] objectForKey:@"resTypeName"] ;
        hotelUserView.contactPostBtn.titleLabel.text = [[post_Mutable objectAtIndex:post_selectedRow] objectForKey:@"positionName"];
    }
    else 
    {
        cookPersonalView.province_btn.titleLabel.text = [province_Mutable objectAtIndex:province_selectedRow];
        cookPersonalView.city_btn.titleLabel.text = [city_Mutable objectAtIndex:city_selectedRow];
        cookPersonalView.post_btn.titleLabel.text = [post_Mutable objectAtIndex:post_selectedRow];
    }

}



#pragma mark-
#pragma mark 注册


- (IBAction)back_click:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}


//无效代码
-(void)pickerViewSelect:(UIButton *)sender
{
    if (hotelUserView.hidden = NO) 
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
    else if (cookPersonalView.hidden = NO)
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
    }
    
    
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
