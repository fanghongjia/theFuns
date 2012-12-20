//
//  ActivityDetailViewController.h
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import <UIKit/UIKit.h>

@interface ActivityDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,BgScrollViewDelegate>
{
      UITableView *mytableView;
    __unsafe_unretained IBOutlet UIImageView *topView;
    __unsafe_unretained IBOutlet UILabel *label_title;
    
    int currentPage;
    
    BgScrollView *bgScroll;
    
    NSMutableArray *tempArr;
    
    NSString *recordCount_string;
    
    NSString *str_type;
    
    NSString *type;

    __unsafe_unretained IBOutlet UIWebView *myWebView;
}

@property (nonatomic, assign) NSString *str_activityId,*str_activityType,*str_issueNum;


@end
