//
//  ActivityViewController.h
//  Totole
//
//  Created by  on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __unsafe_unretained IBOutlet UIImageView *topView;
    
    UITableView *myTableView;
    
}

@end
