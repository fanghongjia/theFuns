//
//  ActivityViewController.h
//  Totole
//
//  Created by  on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BgScrollView.h"

@interface ActivityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,BgScrollViewDelegate>
{
    __unsafe_unretained IBOutlet UIImageView *topView;
    
    UITableView *myTableView;
    
    NSMutableArray *tempArr,*OldActivityArr,*PublicActivityArr;
    
    BgScrollView *bgScroll;
    
    int Ongoing_currentPage,OldActivity_currentPage,PublicActivity_currentPage;
    
    int dataType;
    
    NSString *OngoingActivity_str,*OldActivity_str,*PublicActivity_str;
    
}

@end
