//
//  CookPersonal_view.h
//  Totole
//
//  Created by disan disan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CookPersonal_view : UIView<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *cook_array;
    UITableView *cookPersonal_tableView;
    
    UIButton *province_btn,*city_btn,*post_btn,*next_btn;

}


@end
