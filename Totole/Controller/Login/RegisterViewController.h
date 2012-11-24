//
//  RegisterViewController.h
//  Totole
//
//  Created by disan disan on 12-11-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *hotel_tableView;
    NSArray *hotel_array;
    
    UITextField *myTF,*myTF_1;
    BOOL agree;
}

@end
