//
//  QInterFace.h
//  QXNetWorkTest
//
//  Created by allenapple on 12-6-5.
//   Copyright (c) 2012年 邱新鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QNetWorkManage.h"
#import "MBProgressHUD.h"

typedef enum {
    InterFaceHUDModeDefault=0,                 //默认的加载模式,不响应用户触摸
    InterFaceHUDModeBlackBackground=1,         //黑色的加载等待框,不响应用户触摸
    InterFaceHUDModeBlackViewTouch=2,          //加载的视图可以响应用户触摸
    InterFaceHUDModeBlackViewTouchAndBlack=3,   //黑色的加载等待框,响应用户触摸,不推荐使用,除非分人喜好
    InterFaceHUDModeBlackViewNo=4
} InterFaceHUDMode;

@interface QInterFace : NSObject{

    @private
    QNetWorkFinsh         didFinsh;
    QNetWorkFaild         didFaild;
    QNetWorkDelegate      delegate;
    
#if NS_BLOCKS_AVAILABLE
    QNetWorkFinshBlock    finshBlock;
    QNetWorkErrorBlock    faildBlock;
#endif
    BOOL                  isProgressHUD;//是否加载等待框
    UIView                *HUDbackView;//加载等待框的父视图
    InterFaceHUDMode      HUDMode;
    NSString              *HUDStr;
    MBProgressHUD         *HUD;//加载等待框视图
    Class                  delegateClass;
}

+ (id)interFaceWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget faildSEL:(QNetWorkFaild)_faildSEL intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDbackView:(UIView *)_view;
+ (id)interFaceWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget loadInfo:(NSString *)_info HUDbackView:(UIView *)_view;
+ (id)interFaceWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget faildSEL:(QNetWorkFaild)_faildSEL;


#if NS_BLOCKS_AVAILABLE
+ (id)interFaceWithBlocks:(QNetWorkFinshBlock)_finshBlick ErrorBlock:(QNetWorkErrorBlock)_errorBlock intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview;
+ (id)interFaceWithBlocks:(QNetWorkFinshBlock)_finshBlick loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview;
+ (id)interFaceWithBlocks:(QNetWorkFinshBlock)_finshBlick ErrorBlock:(QNetWorkErrorBlock)_errorBlock;
#endif
/*
 开始执行下载
 */
- (void)starDownLoadWtihInfo:(NSMutableArray *)_muArr MethodStr:(NSString *)_method Type:(NetWorkType)_type;
- (void)starDownLoadWtihASI:(ASIFormDataRequest *)request MethodStr:(NSString *)_method Type:(NetWorkType)_type;

@property(nonatomic,assign)QNetWorkDelegate  delegate;
/*
 @property(nonatomic,assign)QNetWorkFinsh     didFinsh;
 @property(nonatomic,assign)QNetWorkFaild     didFaild;
 @property(nonatomic,assign)QNetWorkDelegate  delegate;
 @property(nonatomic,assign)BOOL              isProgressHUD;
 #if NS_BLOCKS_AVAILABLE
 @property(nonatomic,copy)QNetWorkFinshBlock    finshBlock;
 @property(nonatomic,copy)QNetWorkErrorBlock    faildBlock;
 #endif
 */


@end
