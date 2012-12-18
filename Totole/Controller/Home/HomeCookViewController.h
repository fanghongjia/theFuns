//
//  HomeCookViewController.h
//  Totole
//
//  Created by disan disan on 12-11-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AnnouncementViewController.h"

#import "StyledPageControl.h"


@interface HomeCookViewController : UIViewController<UITabBarControllerDelegate,UIScrollViewDelegate>
{
    IBOutlet UIButton *mall_btn;
    
    IBOutlet UIButton *activity_btn;
    IBOutlet UIButton *announcement_btn;
    IBOutlet UIButton *management_btn;
    IBOutlet UIButton *myFavorites_btn;
    __unsafe_unretained IBOutlet UIScrollView *scroll;
    
    NSMutableArray *tempArr;

    __strong StyledPageControl  *_pageControl;

}

@end
