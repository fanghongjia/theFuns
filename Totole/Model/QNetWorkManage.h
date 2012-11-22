//
//  QNetWorkManage.h
//  QXNetWorkTest
//
//  Created by allenapple on 12-5-31.
//  Copyright (c) 2012年 邱新鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QNetWorkConfig.h"
#define KeyForInfoStr(s)[NSString stringWithFormat:@"QNetWork-%u",[s hash]]
@interface QNetWorkManage : NSObject{

    
  @private
    dispatch_queue_t Qqueue;
    
    
}
/*
 单例模式
 */
+(QNetWorkManage *)sharedNetWork;
#if NS_BLOCKS_AVAILABLE
-(void)netWorkWithBlocks:(QNetWorkFinshBlock)_finshBlock ErrorBlock:(QNetWorkErrorBlock)_errorBlock
               infoArray:(NSArray *)_info Type:(NetWorkType)_type MethodStr:(NSString *)_methodStr;
#endif
-(void)netWorkWithSEL:(QNetWorkFinsh)_finshSEL ErrorBlock:(QNetWorkFaild)_errorSEL
            infoArray:(NSArray *)_info Type:(NetWorkType)_type 
            MethodStr:(NSString *)_methodStr Delegate:(QNetWorkDelegate)_delegate;
-(dispatch_queue_t )getQueueWtihRequestInfo:(NSString *)info;
@end

@interface NSMutableArray (NSMutableArray_setParameter)
//快速设置参数跟参数值
- (void)setParameter:(NSString *)_key Parameter:(id)_object;
@end
