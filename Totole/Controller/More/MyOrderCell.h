//
//  MyOrderCell.h
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MyOrderCell : UITableViewCell
{
    UILabel *lable_11,*lable_12,*lable_13;
    UILabel *lable_21;
    UILabel *lable_31;
    UILabel *lable_41,*lable_42,*lable_43;
    UILabel *lable_51,*lable_52;
    
    UIView *backView;
    UIImageView *imageView;
    
    UIButton *btn_Cancel;
}

@property (nonatomic, strong) UILabel *lable_11,*lable_12,*lable_13,*lable_21,*lable_31;

@property (nonatomic, strong) UILabel *lable_41,*lable_42,*lable_43,*lable_51,*lable_52;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *btn_Cancel;

@end
