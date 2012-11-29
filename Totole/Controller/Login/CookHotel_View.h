//
//  CookHotel_View.h
//  Totole
//
//  Created by disan disan on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol CookHotel_viewDelegate;

@interface CookHotel_View : UIView<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    
    NSArray *cook_array;
    UITableView *cookHotel_tableView;
    
    UIButton *provinceCook_btn,*cityCook_btn;
    
    
    UITextField *hotelName_TF,*hotelAddress_TF,*orderPhone_TF,*inviteesID_TF;
    BOOL agree;
}

@property (nonatomic,assign) id<CookHotel_viewDelegate> CookHotel_viewDelegate;

@end



@protocol CookHotel_viewDelegate <NSObject>

@optional

- (void)cookHotel_selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index;


@end
