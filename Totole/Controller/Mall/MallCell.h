//
//  MallCell.h
//  Totole
//
//  Created by disan disan on 12-12-7.
//
//

#import <UIKit/UIKit.h>

@interface MallCell : UITableViewCell
{
    UIImageView *imageView;
    UILabel *lable_1;
    UILabel *lable_price;
    UILabel *lable_unit;
    UILabel *stockAmount_lb;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *lable_1;
@property (nonatomic, strong) UILabel *lable_price;
@property (nonatomic, strong) UILabel *lable_unit;
@property (nonatomic, strong) UILabel *stockAmount_lb;

@end
