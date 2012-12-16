//
//  ConfirmOrderCell.h
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import <UIKit/UIKit.h>

@interface ConfirmOrderCell : UITableViewCell
{
    UILabel *lable_1;
    UILabel *lable_price;
    UILabel *lable_unit;
    UILabel *lable_count;
    
}

@property (nonatomic, strong) UILabel *lable_1;
@property (nonatomic, strong) UILabel *lable_price;
@property (nonatomic, strong) UILabel *lable_unit,*lable_count;

@end
