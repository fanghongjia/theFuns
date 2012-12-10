//
//  MallDetailViewController.h
//  Totole
//
//  Created by disan disan on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BgScrollView.h"


@interface MallDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,BgScrollViewDelegate>
{
    UITableView *mytableView; 
    
    NSMutableArray *tempArr,*popular_tempArr,*new_tempArr,*integral_tempArr;
    NSMutableArray *mallIdMut;
    
    BgScrollView *bgScroll;
    int pageNo_int,pageSise_int;
     
    NSString *recordCount_string,*popularRecordCount_string,*newRecordCount_string,*integralRecordCount_string;
    int currentPage,popular_currentPage,new_currentPage,integral_currentPage;
    int dataType;
    
    __unsafe_unretained IBOutlet UIImageView *top_imagView;
    __unsafe_unretained IBOutlet UIButton *popular_btn;
    __unsafe_unretained IBOutlet UIButton *new_btn;
    __unsafe_unretained IBOutlet UIButton *integral_btn;
    
    __unsafe_unretained IBOutlet UILabel *title_lb;
}

@property(unsafe_unretained, nonatomic) NSString *categoryId;
@property(unsafe_unretained,nonatomic) NSString *title_str;

@end
