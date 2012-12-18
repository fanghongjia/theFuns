//
//  HomeViewController.h
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AnnouncementViewController.h"

#import "StyledPageControl.h"

@interface HomeViewController : UIViewController<UITabBarControllerDelegate,UIScrollViewDelegate>
{
    IBOutlet UIButton *activate_btn;
    IBOutlet UIButton *mall_btn;
    IBOutlet UIButton *activity_btn;
    IBOutlet UIButton *announcement_btn;
    
    IBOutlet UIButton *management_btn;
    IBOutlet UIButton *myFavorites_btn;
    
    NSMutableArray *tempArr;
    
    __unsafe_unretained IBOutlet UIScrollView *scroll;
    
    __strong StyledPageControl  *_pageControl;

}

@end
