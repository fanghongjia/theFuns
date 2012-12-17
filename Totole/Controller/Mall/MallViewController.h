//
//  MallViewController.h
//  Totole
//
//  Created by  on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "MallDetailViewController.h"

@interface MallViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mytableView;
    
    NSArray *tempArr;
    NSMutableArray *categoryIdMut,*categoryNameMut;
    
    dispatch_queue_t loadImageQueue;
    
}

@end
 