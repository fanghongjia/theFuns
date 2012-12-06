//
//  DataSource.h
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "QInterFace.h"



@interface DataSource : QInterFace
{
    dispatch_queue_t loadImageQueue;
}

+ (DataSource *)shareInstance;

// 加载图片
- (void)loadImageInThread:(NSString*)dict withView:(id)view;

//饭店用户注册
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

//用户登录
- (void)login:(NSString *)username 
     passwrod:(NSString *)password 
     userType:(NSString *)userType 
operateSource:(NSString *)operateSource 
     mobileId:(NSString *)mobileId;

//获得省份列表（包含城市）
-(void)getProvincesAndCities;

//获得省份列表
-(void)getProvinces;


//获得饭店类型
-(void)getResTypes;


//获得联系人职务
-(void)getPositions;

//激活积分
- (void)activateScore:(NSString *)integralCodeList mobileId:(NSString *)mobileId;
- (void)activateScoreintegralCodeList:(NSMutableArray *)integralCodeList mobileId:(NSString *)mobileId;


//商场列表
- (void)getGiftCategorys;


//根据分类获得商品列表     
- (void)getGiftByCategory:(NSString *)categoryId pageNo:(NSString *)pageNo pageSise:(NSString *)pageSise;

@end
