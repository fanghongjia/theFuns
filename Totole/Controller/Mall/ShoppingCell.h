//
//  ShoppingCell.h
//  Totole
//
//  Created by disan disan on 12-12-11.
//
//

#import <UIKit/UIKit.h>

@interface ShoppingCell : UITableViewCell
{
    UIView *backView;
    UIImageView *imageView;
    UILabel *lable_1;
    UILabel *lable_price;
    UILabel *lable_unit;
    UILabel *stockAmount_lb;
    UIButton *plus_btn,*minu_btn,*delete_btn;
    UITextField *number_TF;
}

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *lable_1;
@property (nonatomic, strong) UILabel *lable_price;
@property (nonatomic, strong) UILabel *lable_unit;
@property (nonatomic, strong) UILabel *stockAmount_lb;
@property (nonatomic, strong) UITextField *number_TF;
@property (nonatomic, strong) UIButton *plus_btn;
@property (nonatomic, strong) UIButton *minu_btn;
@property (nonatomic, strong) UIButton *delete_btn;

@end
