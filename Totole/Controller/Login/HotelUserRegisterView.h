//
//  HotelUserRegisterView.h
//  Totole
//
//  Created by 王菲 on 12-11-28.
//
//

#import <UIKit/UIKit.h>

@protocol HotelUserRegisterDelegate;   
@interface HotelUserRegisterView : UIScrollView<UITextFieldDelegate>
{
    
    UITextField *hotelNameText,*userNameText,*passwordText,*comfrimPassText,*orderMobileText,*UITextField,*addressText,*contactText,*contactPhoneText,*invitePeopleText;
    
    BOOL    isAgree;
}
@property (nonatomic,unsafe_unretained) id<HotelUserRegisterDelegate> childDelegate;
@property (nonatomic) UIButton *provinceBtn;
@property (nonatomic) UIButton *cityBtn;
@property (nonatomic) UIButton *hotelTypeBtn;
@property (nonatomic) UIButton *contactPostBtn;
@property (nonatomic,copy)  NSString  *provinceId;
@property (nonatomic,copy)  NSString  *cityId;

@end

@protocol HotelUserRegisterDelegate <NSObject>

@optional
- (void)selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index;
@end