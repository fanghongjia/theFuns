//
//  ActivationFailsViewController.h
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ActivationFailsViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource>
{
    __unsafe_unretained IBOutlet UIView *head_view;
    __unsafe_unretained IBOutlet UIView *foot_view;
    UITableView *resule_tableView;
    __unsafe_unretained IBOutlet UILabel *incomeScore_la;
    NSString *incomeScore_str;
}

@property (nonatomic,strong)NSMutableArray *failedList_arr;
@property (nonatomic,copy)NSString *incomeScore_str;
@end
