//
//  QNetWorkManage.m
//  QXNetWorkTest
//
//  Created by allenapple on 12-5-31.
//  Copyright (c) 2012年 邱新鹏. All rights reserved.
//

#import "QNetWorkManage.h"
static QNetWorkManage* _instance;

static inline ASIFormDataRequest* QMackASIRequest(NSString *URLStr) {
	
    NSString *encodedComment= [URLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:encodedComment];
    
    //NSURL *url=[NSURL URLWithString:URLStr];
    ASIFormDataRequest  *request=[ASIFormDataRequest requestWithURL:url];
    [request setResponseEncoding:NSUTF8StringEncoding];
    [request setNumberOfTimesToRetryOnTimeout:REQUST_ToRetry ];
    [request setPersistentConnectionTimeoutSeconds:REQUST_TimeOut];
#if DEBUG_NetWorkFig
    NETWORK_DeBug_Log(@"连接URL-:%@",url);
	NETWORK_DeBug_Log(@"创建ASIRequest: %@",request);
   // NETWORK_DeBug_Log(@"ASIRequest URL: %@",URLStr);
#endif
	return request;
}
static inline ASIFormDataRequest *setASIRequest(NSArray *infoArr,NetWorkType tpye,NSString *URLStr,NSString *methodStr){

    
    /*
    if (![[infoArr objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
#if DEBUG_NetWorkFig
        NETWORK_DeBug_Log(@"设置参数错误: %@",infoArr);
#endif    
        return nil;
    }
     */
    
    if (infoArr.count%2!=0) {
#if DEBUG_NetWorkFig
        //NETWORK_DeBug_Log(@"设置参数错误: %@",infoArr);
        QLog(@"设置参数错误: %@",infoArr);
#endif    
        return nil;
    }

    ASIFormDataRequest  *request;
    if (tpye==NetWorkTypeGET) {
        
        NSMutableString *requestStr=[[NSMutableString alloc]init];
        NSArray *tempArr=[infoArr retain];
        
        
        for (int i=0; i<tempArr.count/2; i++) {
            
            if (i==0) {
                
               [requestStr appendFormat:@"?%@=%@",[tempArr objectAtIndex:0],[tempArr objectAtIndex:1]]; 
                
            }else{
                
                [requestStr appendFormat:@"&%@=%@",[tempArr objectAtIndex:i*2],[tempArr objectAtIndex:i*2+1]];
            }
            
            
        }
    
        /*
        for (NSDictionary *dict in tempArr) {
            
                       
            NSString *key=[[dict allKeys] lastObject];
            NSString *info=[dict objectForKey:key];
            
            if ([requestStr length]==0) {
                [requestStr appendFormat:@"?%@=%@",key,info];
            }else{
                
                [requestStr appendFormat:@"&%@=%@",key,info];
            }
            
        }
         */
        
        NSString *requestAddress = [NSString stringWithFormat:@"%@%@%@",URLStr,methodStr,requestStr];
        request=QMackASIRequest(requestAddress);
        [tempArr release];
        [requestStr release];
        
    }else if(tpye==NetWorkTypePOST){
    
        
        NSMutableDictionary *tempDict =[NSMutableDictionary dictionary];
        
        NSString *requestAddress = [NSString stringWithFormat:@"%@%@",URLStr,methodStr];
        request=QMackASIRequest(requestAddress);
        NSArray *tempArr=[infoArr retain];
        
        for (int i=0; i<tempArr.count/2; i++) {
        
            // [request setPostValue:[tempArr objectAtIndex:i*2+1] forKey:[tempArr objectAtIndex:i*2]];
        
            [tempDict setObject:[tempArr objectAtIndex:i*2+1] forKey:[tempArr objectAtIndex:i*2]];
           
        }
        
//        NSLog(@"tempDict == %@",tempDict);
        NSString *str=[tempDict JSONRepresentation];
        NSLog(@"str:%@",str);
        [request appendPostData:[str dataUsingEncoding:NSUTF8StringEncoding]];
        [request setPostLength:str.length];
        [request addRequestHeader:@"Content-Type" value:@"application/json"];

        /*
        for (NSDictionary *dict in tempArr) {
            
            NSString *key=[[dict allKeys] lastObject];
            NSString *info=[dict objectForKey:key];
            [request setPostValue:info forKey:key];
           
        }
         */
        [tempArr release];
    }
    
    

#if DEBUG_NetWorkFig
	NETWORK_DeBug_Log(@"设置ASIRequest: %@",request);
#endif
      return request;
}

@interface QNetWorkManage ()


@end

@implementation QNetWorkManage

- (id)init {
	
    if((self = [super init])) {
        /*
#if TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_3
        Qqueue = dispatch_queue_create("QNetWork.Queue", DISPATCH_QUEUE_CONCURRENT);
#else 
        Qqueue = dispatch_queue_create("QNetWork.MyQueue", NULL);
#endif
         */

	}
	return self;
}
/*
 单例模式
 */
+(QNetWorkManage *)sharedNetWork{
    
    @synchronized(self) {
        if(!_instance) {
            _instance = [[QNetWorkManage alloc] init];
        }
    }
    return _instance;
}
-(dispatch_queue_t )getQueueWtihRequestInfo:(NSString *)info{
    
    NSString *infoStr=KeyForInfoStr(info);
    //NSString *infoStr;
#if TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_3
    dispatch_queue_t queue = dispatch_queue_create([infoStr UTF8String], DISPATCH_QUEUE_CONCURRENT);
#else 
    dispatch_queue_t queue = dispatch_queue_create([infoStr UTF8String], NULL);
#endif
    return queue;
}
#if NS_BLOCKS_AVAILABLE
-(void)netWorkWithBlocks:(QNetWorkFinshBlock)_finshBlock ErrorBlock:(QNetWorkErrorBlock)_errorBlock
               infoArray:(NSArray *)_info Type:(NetWorkType)_type MethodStr:(NSString *)_methodStr{

    dispatch_block_t block = ^{
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        ASIFormDataRequest *request=setASIRequest(_info, _type, ServerMainAddress, _methodStr);
        [request setUseCookiePersistence:YES];
        [request startSynchronous];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (request.error) {
                NSError *error=[request.error copy];
                _errorBlock(error);
                [error release];
            }else{
              //  NSString *str=[[NSString alloc]initWithBytes:request.responseData.bytes length:request.responseData.length encoding:request.responseEncoding];
#if DEBUG_NetWorkresponseString
                NETWORK_DeBug_Log(@"返回的String: %@",request.responseString);
#endif
                NSData  *responseData=[[NSData alloc] initWithData:request.responseData];
                
                id object=[[responseData JSONValue] mutableCopy];
                
                
                if ([object isKindOfClass:[NSDictionary class]]) {
                    
                    [object setObject:request.responseCookies forKey:@"cookies"];
                    
                }else if ([object isKindOfClass:[NSArray class]]) {
                    
                    [object addObject:request.responseCookies];
                    
                }
                
                _finshBlock(object); 
                [responseData release];
                [object release];
            }
            [request clearDelegatesAndCancel];
        });	 
        [pool release];
    };
    if (!Qqueue) {
        Qqueue=[self getQueueWtihRequestInfo:_methodStr];
    }
    dispatch_async(Qqueue, block);
    [block release];
    [_finshBlock release];_finshBlock=nil;
    [_errorBlock release];_errorBlock=nil;
    dispatch_release(Qqueue);
    Qqueue=nil;
    

}
#endif
-(void)netWorkWithSEL:(QNetWorkFinsh)_finshSEL ErrorBlock:(QNetWorkFaild)_errorSEL
            infoArray:(NSArray *)_info Type:(NetWorkType)_type 
            MethodStr:(NSString *)_methodStr Delegate:(QNetWorkDelegate)_delegate{

    dispatch_block_t block = ^{
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        ASIFormDataRequest *request=setASIRequest(_info, _type, ServerMainAddress, _methodStr);
        [request startSynchronous];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (request.error) {
                [_delegate performSelector:_errorSEL withObject:request.error];
            }else{
                
#if DEBUG_NetWorkresponseString
                NETWORK_DeBug_Log(@"返回的String: %@",request.responseString);
#endif
                NSData  *responseData=[[NSData alloc] initWithData:request.responseData];
                [_delegate performSelector:_finshSEL withObject:[responseData JSONValue]];
                [responseData release];
                
            }
            [request clearDelegatesAndCancel];
        });	 
        [pool release];
    };
    if (!Qqueue) {
      Qqueue=[self getQueueWtihRequestInfo:_methodStr];  
    }
    dispatch_async(Qqueue, block);
    [block release];
    dispatch_release(Qqueue);
    Qqueue=nil;
}


-(void)dealloc{

    dispatch_release(Qqueue);
    Qqueue=nil;
    [super dealloc];
}
@end

@implementation NSMutableArray (NSMutableArray_setParameter)

- (void)setParameter:(NSString *)_key Parameter:(id)_object{
    

    /*
    [self addObject:[NSDictionary dictionaryWithObject:_object forKey:_key]];
     */
    if (_key!=nil) {
        [self addObject:_key];
    }
    if (_object!=nil) {
        [self addObject:_object];
    }
    
}

@end
