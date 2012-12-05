//
//  MallDetailViewController.h
//  Totole
//
//  Created by disan disan on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallDetailViewController : UIViewController
{
    __unsafe_unretained IBOutlet UIImageView *top_imagView;
    __unsafe_unretained IBOutlet UIButton *popular_btn;
    __unsafe_unretained IBOutlet UIButton *new_btn;
    __unsafe_unretained IBOutlet UIButton *integral_btn;
    
}

@property(nonatomic) NSString *categoryId;

@end
