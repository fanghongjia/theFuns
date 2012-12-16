//
//  MyboxCell.h
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import <UIKit/UIKit.h>

@interface MyboxCell : UITableViewCell
{
    UILabel *lable_name,*lable_score,*lable_size,*lable_number,*lable_source,*lable_title,*lable_valid,*lable_time;
    UIButton *button_use;
}
@property (nonatomic, strong) UILabel *lable_name,*lable_score,*lable_size,*lable_number,*lable_source,*lable_title,*lable_valid,*lable_time;

@property (nonatomic, strong) UIButton *button_use;


@end
