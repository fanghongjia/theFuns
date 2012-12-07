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

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *lable_1;
@property (nonatomic, retain) UILabel *lable_price;
@property (nonatomic, retain) UILabel *lable_unit;
@property (nonatomic, retain) UILabel *stockAmount_lb;

@end
