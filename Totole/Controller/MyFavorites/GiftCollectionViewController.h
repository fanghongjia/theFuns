//
//  GiftCollectionViewController.h
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import <UIKit/UIKit.h>
#import "BgScrollView.h"

@interface GiftCollectionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,BgScrollViewDelegate>
{
    UITableView *mytableView;
    
    BgScrollView *bgScroll;
    
    int currentPage;
    
    NSString *recordCount_string; 
    
    NSMutableArray *tempArr; 
}


@end
