//
//  QInterFace.m
//  QXNetWorkTest
//
//  Created by allenapple on 12-6-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "QInterFace.h"

Class object_getClass(id object);
@interface QInterFace ()
//初始化接口类
- (id)initWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget faildSEL:(QNetWorkFaild)_faildSEL intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview;
#if NS_BLOCKS_AVAILABLE
- (id)initWithBlocks:(QNetWorkFinshBlock)_finshBlick ErrorBlock:(QNetWorkErrorBlock)_errorBlock intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview;
#endif

@end

@implementation QInterFace
@synthesize delegate;

//@synthesize didFinsh,didFaild,delegate,isProgressHUD,finshBlock,faildBlock;

/*------------------------------------------------------------------------------------------------------------
 ------------------------------------为了方便写的一些方法,有些臃肿------------------------------------------------
 ------------------------------------------------------------------------------------------------------------*/
-(void)dealloc{
#if NS_BLOCKS_AVAILABLE
    Block_release(finshBlock);
    Block_release(faildBlock);
#endif
    didFinsh=nil;
    didFaild=nil;
    [HUDStr release];HUDStr=nil;
    [super dealloc];
}

- (id)initWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget faildSEL:(QNetWorkFaild)_faildSEL intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview{
    
    self = [super init];
    if (self) {
        didFinsh=_finshSEL;
        didFaild=_faildSEL;
        delegate=_deleaget;
        delegateClass=object_getClass(delegate);
        if (_mode || _info) {
            HUDMode=_mode;
            HUDStr=[_info copy];
            HUDbackView=_HUDview;
            isProgressHUD=YES;
        }else{
        
            isProgressHUD=NO;
        }
    }
    return self;
}
#if NS_BLOCKS_AVAILABLE
- (id)initWithBlocks:(QNetWorkFinshBlock)_finshBlick ErrorBlock:(QNetWorkErrorBlock)_errorBlock intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview{

    self = [super init];
    if (self) {
        finshBlock=[_finshBlick copy];
        if (_errorBlock) {
            faildBlock=[_errorBlock copy];
        }
        if (_mode || _info) {
            HUDMode=_mode;
            HUDStr=[_info copy];
            HUDbackView=_HUDview;
            isProgressHUD=YES;
        }else{
            
            isProgressHUD=NO;
        }
    }
    return self;
    
}
#endif

/***/

- (void)starDownLoadWtihASI:(ASIFormDataRequest *)request MethodStr:(NSString *)_method Type:(NetWorkType)_type{

    
    if (isProgressHUD==YES) {
        
        if (HUDbackView) {
            
            HUD = [[MBProgressHUD showHUDAddedTo:HUDbackView animated:YES] retain]; 
        }else{
            
            UIWindow *myWindows=[[UIApplication sharedApplication] keyWindow];
            HUD = [[MBProgressHUD showHUDAddedTo:myWindows animated:YES] retain];
            
        }
        HUD.animationType=MBProgressHUDAnimationFade;
        HUD.square = YES;
        HUD.labelText=HUDStr;
        if (HUDMode==InterFaceHUDModeDefault) {
            
            HUD.dimBackground=NO;
            
        }else if(HUDMode==InterFaceHUDModeBlackBackground){
            
            HUD.dimBackground=YES;
            
        }else if(HUDMode==InterFaceHUDModeBlackViewTouch){
            
            HUD.userInteractionEnabled=NO;
            
        }else if(HUDMode==InterFaceHUDModeBlackViewTouchAndBlack){
            
            HUD.userInteractionEnabled=NO;
            HUD.dimBackground=YES;
        }
    }

    
    [request setCompletionBlock:^{
        
        
        if (object_getClass(self.delegate)==delegateClass) {
//            NSLog(@"====== %@", request.responseString);
            if (finshBlock) {
                finshBlock([request.responseString JSONValue]);
            }
            else if (didFinsh) {
                
                [delegate performSelector:didFinsh withObject:[request.responseString JSONValue]];
            }
            
        }
        if (isProgressHUD) {
            
            [HUD hide:NO];
            [HUD release];
            HUD=nil;
            
        }
        [self release];
        
    }];
    
    [request setFailedBlock:^{
        
        if (object_getClass(self.delegate)==delegateClass) {
            if (faildBlock) {
                faildBlock(request.error);
            }
            else if (didFaild) {
                
                [delegate performSelector:didFaild withObject:request.error];
            }
        }
        
        
        if (isProgressHUD) {
            [HUD hide:NO];
            [HUD release];
            HUD=nil;
        }
        [self release];
    }];
    
    [request startAsynchronous];
}
/*
 开始执行下载
 */
- (void)starDownLoadWtihInfo:(NSMutableArray *)_muArr MethodStr:(NSString *)_method Type:(NetWorkType)_type{

    NSMutableArray *tempArr=[_muArr retain];
    if (isProgressHUD==YES) {
        
        if (HUDbackView) {
            
            HUD = [[MBProgressHUD showHUDAddedTo:HUDbackView animated:YES] retain]; 
        }else{
            
            UIWindow *myWindows=[[UIApplication sharedApplication] keyWindow];
            HUD = [[MBProgressHUD showHUDAddedTo:myWindows animated:YES] retain];
            
        }
        HUD.animationType=MBProgressHUDAnimationFade;
        HUD.square = YES;
        HUD.labelText=HUDStr;
        if (HUDMode==InterFaceHUDModeDefault) {
            
            HUD.dimBackground=NO;
            
        }else if(HUDMode==InterFaceHUDModeBlackBackground){
            
            HUD.dimBackground=YES;
            
        }else if(HUDMode==InterFaceHUDModeBlackViewTouch){
            
            HUD.userInteractionEnabled=NO;
            
        }else if(HUDMode==InterFaceHUDModeBlackViewTouchAndBlack){
            
            HUD.userInteractionEnabled=NO;
            HUD.dimBackground=YES;
        }
    }
    
    [[QNetWorkManage sharedNetWork] netWorkWithBlocks:^(id response){
    
        if (object_getClass(self.delegate)==delegateClass) {
        
            if (finshBlock) {
                finshBlock(response);
            }
            else if (didFinsh) {
                
                [delegate performSelector:didFinsh withObject:response];
            }
        
        }
        if (isProgressHUD) {
            
            [HUD hide:NO];
            [HUD release];
            HUD=nil;
            
        }
        [self release];
    } ErrorBlock:^(NSError *errorStr){
    
        if (object_getClass(self.delegate)==delegateClass) {
            if (faildBlock) {
                faildBlock(errorStr);
            }
            else if (didFaild) {
                
                [delegate performSelector:didFaild withObject:errorStr];
            }
        }
        
        
        if (isProgressHUD) {
            [HUD hide:NO];
            [HUD release];
            HUD=nil;
        }
        [self release];
        
    } infoArray:tempArr Type:_type MethodStr:_method];
    [tempArr release];

}
+ (id)interFaceWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget faildSEL:(QNetWorkFaild)_faildSEL intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDbackView:(UIView *)_view{
    
    return [[self alloc]initWithSEL:_finshSEL deleaget:_deleaget faildSEL:_faildSEL intFaceHUD:_mode loadInfo:_info HUDBackView:_view] ;

}
+ (id)interFaceWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget loadInfo:(NSString *)_info HUDbackView:(UIView *)_view{

    return [[self alloc]initWithSEL:_finshSEL deleaget:_deleaget faildSEL:nil intFaceHUD:InterFaceHUDModeDefault loadInfo:_info HUDBackView:_view] ;
}
+ (id)interFaceWithSEL:(QNetWorkFinsh)_finshSEL deleaget:(QNetWorkDelegate)_deleaget faildSEL:(QNetWorkFaild)_faildSEL{

    return [[self alloc]initWithSEL:_finshSEL deleaget:_deleaget faildSEL:nil intFaceHUD:InterFaceHUDModeDefault loadInfo:nil HUDBackView:nil];
}
#if NS_BLOCKS_AVAILABLE
+ (id)interFaceWithBlocks:(QNetWorkFinshBlock)_finshBlick ErrorBlock:(QNetWorkErrorBlock)_errorBlock intFaceHUD:(InterFaceHUDMode)_mode loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview{

    return [[self alloc]initWithBlocks:_finshBlick ErrorBlock:_errorBlock intFaceHUD:_mode loadInfo:_info HUDBackView:_HUDview] ;
}
+ (id)interFaceWithBlocks:(QNetWorkFinshBlock)_finshBlick loadInfo:(NSString *)_info HUDBackView:(UIView *)_HUDview{
    
    return [[self alloc]initWithBlocks:_finshBlick ErrorBlock:nil intFaceHUD:InterFaceHUDModeDefault loadInfo:_info HUDBackView:_HUDview] ;

}
+ (id)interFaceWithBlocks:(QNetWorkFinshBlock)_finshBlick ErrorBlock:(QNetWorkErrorBlock)_errorBlock{

    return [[self alloc]initWithBlocks:_finshBlick ErrorBlock:_errorBlock intFaceHUD:InterFaceHUDModeDefault loadInfo:nil HUDBackView:nil] ;
}
#endif




@end
