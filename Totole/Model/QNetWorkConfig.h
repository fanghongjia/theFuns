

#define REQUST_TimeOut 20  //设置超时时间
#define REQUST_ToRetry 2   //设置失败重置次数
//#define ServerMainAddress @"http://192.168.0.59/" //设置内部测试地址
#define ServerMainAddress @"http://nta.ws.we-win.tk/ws/" //设置外网地址




enum {
    NetWorkTypeGET = 1,//GET方法
    NetWorkTypePOST    //POST方法
};
typedef NSUInteger NetWorkType;

# define QLog(fmt, ...) NSLog((@"%s [第%d行]:" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#ifndef NETWORK_DeBug_Log
#define NETWORK_DeBug_Log QLog
#endif


/*
 *是否开启调试netWork运行信息
 */
#ifndef DEBUG_NetWorkFig
#define DEBUG_NetWorkFig 1
#endif
/*
 *是否开启调试获取String
 */
#ifndef DEBUG_NetWorkresponseString
#define DEBUG_NetWorkresponseString 1
#endif

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@class QNetWorkManage;


@protocol QNetWorkManageDelegate <NSObject>

@optional

@end

typedef SEL QNetWorkFinsh;
typedef SEL QNetWorkFaild;
typedef id  QNetWorkDelegate;


#if NS_BLOCKS_AVAILABLE
typedef void (^QNetWorkFinshBlock)(id response);
typedef void (^QNetWorkErrorBlock)(NSError *errorStr);
#endif