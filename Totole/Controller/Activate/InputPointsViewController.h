//
//  InputPointsViewController.h
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputPointsViewController : UIViewController<UITableViewDelegate,
UITableViewDataSource,UITextFieldDelegate>
{
    UITableView *myTableView;
//    __unsafe_unretained IBOutlet UIScrollView *back_scrollView;
    
    __unsafe_unretained IBOutlet UIView *headerView;
    int numberOfRow;
    UIButton *input_btn,*doneButton;
}

@end
