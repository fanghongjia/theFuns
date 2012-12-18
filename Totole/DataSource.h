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

//截取特殊符号
+(NSString *)getHTMLChangge:(NSString *)_str;

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
- (void)activateScoreintegralCodeList:(NSMutableArray *)integralCodeList;


//商场列表
- (void)getGiftCategorys;


//根据分类获得商品列表     
- (void)getGiftByCategory:(NSString *)categoryId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;


//热门  根据兑换量显示
-(void)getGiftsOrderHot:(NSString *)categoryId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;


//最新  根据最新上架顺序显示商品
-(void)getGiftsOrderTime:(NSString *)categoryId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;


//分值  根据价格显示DESC
-(void)getGiftsOrderPrice:(NSString *)categoryId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//商场 查看某一商品详情
-(void)giftDetail_giftId:(NSString *)giftId;

//查看正在进行的活动
-(void)getOngoingActivity_pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//查看往期活动
-(void)getOldActivity_pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//查看预告活动
-(void)getPublicActivity_pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//加入购物车
-(void)addToCart_giftId:(NSString *)giftId;

//添加到收藏夹
-(void)addToFavorite_giftId:(NSString *)giftId;

//显示我收藏的商品列表
-(void)myFavorites_pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//删除收藏的商品
-(void)deleteFavorite_collectId:(NSString *)collectId;

//搜索商品 mallService/searchGift  {keyword:"电视"，categoryId:"2"，priceId:"3"}
-(void)searchGift_keyword:(NSString *)keyword categoryId:(NSString *)categoryId priceId:(NSString *)priceId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//获得首页幻灯片图片列表
-(void)getPptImages;

//显示优惠活动列表
-(void)getPreferentialGifts_activityId:(NSString *)activityId pageNo:(NSString *)pageNo pageSize:(NSString *)pageSize;

//显示活动详情
-(void)getActivityDetail_itemId:(NSString *)itemId;

//退出登录
-(void)logout;

@end
