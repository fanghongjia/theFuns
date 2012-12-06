//
//  CookPersonal_view.h
//  Totole
//
//  Created by disan disan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CookHotel_View.h"

@protocol CookPersonal_viewDelegate;
@interface CookPersonal_view : UIView<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSArray *cook_array;
    UITableView *cookPersonal_tableView;
    
    UIButton *__unsafe_unretained province_btn,*__unsafe_unretained city_btn,*__unsafe_unretained post_btn,*next_btn;

    UITextField *userName_TF,*name_TF,*password_TF,*confirmPassword_TF,*address_TF,*phone_TF;
}
@property (unsafe_unretained, nonatomic) UIButton *province_btn;
@property (unsafe_unretained, nonatomic) UIButton *city_btn;
@property (unsafe_unretained, nonatomic) UIButton *post_btn;


@property (nonatomic,unsafe_unretained) id<CookPersonal_viewDelegate> CookPersonal_viewDelegate;

@end

@protocol CookPersonal_viewDelegate <NSObject>

@optional

- (void)cook_selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index;

-(void)nextStepRegister:(UIView *)view diction:(NSDictionary *)diction;
@end