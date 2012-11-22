//
//  HomeViewController.h
//  Totole
//
//  Created by disan disan on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITabBarControllerDelegate>
{
    IBOutlet UIButton *activate_btn;
    IBOutlet UIButton *mall_btn;
    IBOutlet UIButton *activity_btn;
    IBOutlet UIButton *announcement_btn;
    
    IBOutlet UIButton *management_btn;
    IBOutlet UIButton *myFavorites_btn;
}

@end
