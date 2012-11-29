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
@property (nonatomic,assign) id<HotelUserRegisterDelegate> childDelegate;
@property (nonatomic,retain) UIButton *provinceBtn;
@property (nonatomic,retain) UIButton *cityBtn;
@property (nonatomic,retain) UIButton *hotelTypeBtn;
@property (nonatomic,retain) UIButton *contactPostBtn;
@property (nonatomic,copy)  NSString  *provinceId;
@property (nonatomic,copy)  NSString  *cityId;

@end

@protocol HotelUserRegisterDelegate <NSObject>

@optional
- (void)selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index;
@end