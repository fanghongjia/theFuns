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
    BOOL    isAgree;
}
@property (nonatomic,assign) id<HotelUserRegisterDelegate> childDelegate;
@property (nonatomic,retain) UIButton *provinceBtn;
@property (nonatomic,retain) UIButton *cityBtn;
@property (nonatomic,retain) UIButton *hotelTypeBtn;
@property (nonatomic,retain) UIButton *contactPostBtn;

@end

@protocol HotelUserRegisterDelegate <NSObject>

@optional
- (void)selectedControlFromPickView:(UIView *)view indexAtControl:(NSInteger)index;
@end