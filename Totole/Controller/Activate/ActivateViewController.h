//
//  ActivateViewController.h
//  Totole
//
//  Created by  on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "ZBarSDK.h"


@interface ActivateViewController : UIViewController<ZBarReaderDelegate,UITableViewDelegate,UITableViewDataSource>
{    
    UITableView *myTableView;
    NSMutableArray *reader_MutableArr;

    __unsafe_unretained IBOutlet UILabel *activateNumber_lb;
    __unsafe_unretained IBOutlet UILabel *activateResult_lb;
    
    __unsafe_unretained IBOutlet UIView *myView;
    ZBarReaderController *Reader;
}

@end
