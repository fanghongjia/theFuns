//
//  DataSource.m
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataSource.h"
static DataSource *loadImage = nil;

@implementation DataSource

-(id)init 
{
    self = [super init];
    
    if(self)
    {
        loadImageQueue = dispatch_queue_create("LoadImage.MyQueue", NULL);        
    }
    
    return self;
}
//单例 下载图片
+ (DataSource *)shareInstance
{
    @synchronized(self)
    {
        if (loadImage == nil)
        {
            loadImage = [[DataSource alloc] init];
        }
    }
    
    return loadImage;
}

// 加载图片
- (void)loadImageInThread:(NSString*)url_str withView:(id)view
{
    dispatch_async(loadImageQueue, ^{
        //        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                                                 [NSURL URLWithString:url_str]]];
        if (image) {
            
            //进入主线程里操作
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if ([view isKindOfClass:[UIButton class]])
                {
                    UIButton *button = (UIButton *)view;
                    [button setBackgroundImage:image forState:UIControlStateNormal];
                }
                if ([view isKindOfClass:[UIImageView class]])
                {
                    UIImageView *iconView = (UIImageView *)view;
                    iconView.image = image;
                }
                
            });
        }
        //        [pool drain];
    });
}

-(void)starDownLoadWtihInfo:(NSMutableArray *)_muArr MethodStr:(NSString *)_method Type:(NetWorkType)_type
{
    //    NSLog(@"_muArr == %@",_muArr);
    [super starDownLoadWtihInfo:_muArr MethodStr:_method Type:_type];
}


//{province:"3",city:"427",restaurantName:"某餐厅",userName:"loginName",password:"123456",reservationTel:"02166551234",address:"某某区某某路165号",restaurantType:"中餐",contact:"王掌柜",contactPosition :"总经理",contactMobile:"13838381234",inviteCode:"113"}
//1、会员注册
-(void)registeruser_province:(NSString *)province 
                        city:(NSString *)city  
              restaurantName:(NSString *)restaurantName 
                    userName:(NSString *)userName 
                    password:(NSString *)password 
              reservationTel:(NSString *)reservationTel 
                     address:(NSString *)address 
              restaurantType:(NSString *)restaurantType 
                     contact:(NSString *)contact 
             contactPosition:(NSString *)contactPosition 
               contactMobile:(NSString *)contactMobile 
                  inviteCode:(NSString *)inviteCode;
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    
    [mArray setParameter:@"province" Parameter:province];
    [mArray setParameter:@"city" Parameter:city];
    [mArray setParameter:@"restaurantName" Parameter:restaurantName];
    
    [mArray setParameter:@"userName" Parameter:userName];
    [mArray setParameter:@"password" Parameter:password];
    [mArray setParameter:@"reservationTel" Parameter:reservationTel];
    
    [mArray setParameter:@"address" Parameter:address];
    [mArray setParameter:@"restaurantType" Parameter:restaurantType];
    [mArray setParameter:@"contact" Parameter:contact];
    
    [mArray setParameter:@"contactPosition" Parameter:contactPosition];
    [mArray setParameter:@"contactMobile" Parameter:contactMobile];
    [mArray setParameter:@"inviteCode" Parameter:inviteCode];
    
    [self starDownLoadWtihInfo:mArray MethodStr:@"userService/register_Restaurant" Type:NetWorkTypePOST];
}

//登录  "userName" : "yyyy", "password" : "111111", "userType" : 1, "operateSource" : 2, "mobileId" : "6546419866156515"  
- (void)login:(NSString *)username 
     passwrod:(NSString *)password 
     userType:(NSString *)userType 
operateSource:(NSString *)operateSource 
     mobileId:(NSString *)mobileId
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [mArray setParameter:@"userName" Parameter:username];
    [mArray setParameter:@"password" Parameter:password];
    [mArray setParameter:@"userType" Parameter:userType];
    [mArray setParameter:@"operateSource" Parameter:operateSource];
    [mArray setParameter:@"mobileId" Parameter:mobileId];
    
    
//    [mArray setParameter:username Parameter:@"username"];
//    [mArray setParameter:password Parameter:@"password"];
//    [mArray setParameter:userType Parameter:@"userType"];
//    [mArray setParameter:operateSource Parameter:@"operateSource"];
//    [mArray setParameter:mobileId Parameter:@"mobileId"];
    
    [self starDownLoadWtihInfo:mArray MethodStr:@"userService/login" Type:NetWorkTypePOST];
    //    NSLog(@"mArray == %@",mArray);
}


//获得省份列表（包含城市）
-(void)getProvincesAndCities{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [self starDownLoadWtihInfo:mArray MethodStr:@"dropDownListService/getProvincesAndCities" Type:NetWorkTypeGET];
}

//获得省份列表
-(void)getProvinces{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [self starDownLoadWtihInfo:mArray MethodStr:@"dropDownListService/getProvinces" Type:NetWorkTypeGET];
}

//获得饭店类型
-(void)getResTypes
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [self starDownLoadWtihInfo:mArray MethodStr:@"dropDownListService/getResTypes" Type:NetWorkTypeGET];
}

//获得联系人职务
-(void)getPositions
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [self starDownLoadWtihInfo:mArray MethodStr:@"dropDownListService/getPositions" Type:NetWorkTypeGET];
}


//积分激活 userService/activateScore   sessionId,{integralCodeList:[{integralCode:"568745615871225"},{integralCode:"215846328795216"}],mobileId:"mobileId"}
- (void)activateScore:(NSString *)integralCodeList mobileId:(NSString *)mobileId
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    
    [mArray setParameter:@"integralCodeList" Parameter:integralCodeList];
    [mArray setParameter:@"mobileId" Parameter:mobileId];

    [self starDownLoadWtihInfo:mArray MethodStr:@"userService/activateScore" Type:NetWorkTypePOST];
}

- (void)activateScoreintegralCodeList:(NSMutableArray *)integralCodeList mobileId:(NSString *)mobileId
{
    NSString *str=[NSString stringWithFormat:@"%@%@",ServerMainAddress,@"userService/activateScore"];
    
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:str]];
    mainDelegate = MYDELEGATE;
    NSMutableArray *cookit=[[mainDelegate myCookie] mutableCopy];
    [request setUseCookiePersistence:YES];
    [request setRequestCookies:cookit];

    
    NSMutableDictionary *dictd=[NSMutableDictionary dictionary];
    [dictd setObject:integralCodeList forKey:@"integralCodeList"];
    NSString *strd=[dictd JSONRepresentation];
    NSLog(@"strd:%@",strd);
    
    
    [request appendPostData:[strd dataUsingEncoding:NSUTF8StringEncoding]];
    [request setPostLength:strd.length];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    
    
    [self starDownLoadWtihASI:request MethodStr:@"userService/activateScore" Type:NetWorkTypePOST];

//    [self starDownLoadWtihInfo:mArray MethodStr:@"userService/activateScore" Type:NetWorkTypePOST];
}

//商场列表
- (void)getGiftCategorys
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [self starDownLoadWtihInfo:mArray MethodStr:@"mallService/getGiftCategorys" Type:NetWorkTypeGET];
}

//

- (void)getResTypd
{
    ASIFormDataRequest *request=nil;
    mainDelegate = MYDELEGATE;
    NSMutableArray *cookit=[[mainDelegate myCookie] mutableCopy];
    [request setUseCookiePersistence:YES];
    [request setRequestCookies:cookit];
    NSMutableArray *mArray = [[NSMutableArray alloc] init];    
    
    [mArray setParameter:@"integralCodeList" Parameter:@""];
    [mArray setParameter:@"mobileId" Parameter:@""];
    
     NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mArray];
    NSMutableData *mData  = [NSMutableData dataWithData:data];
    [request setPostBody:mData];
    [self starDownLoadWtihASI:request MethodStr:@"mallService/getGiftCategorys" Type:NetWorkTypePOST];
}

//根据分类获得商品列表     categoryId,pageNo,pageSise
- (void)getGiftByCategory:(NSString *)categoryId pageNo:(NSString *)pageNo pageSise:(NSString *)pageSise
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    [mArray setParameter:@"categoryId" Parameter:categoryId];
    [mArray setParameter:@"pageNo" Parameter:pageNo];
    [mArray setParameter:@"pageSise" Parameter:pageSise];
        
    [self starDownLoadWtihInfo:mArray MethodStr:@"mallService/getGiftsByCategory" Type:NetWorkTypePOST];
}


@end
