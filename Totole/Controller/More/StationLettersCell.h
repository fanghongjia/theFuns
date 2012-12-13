//
//  StationLettersCell.h
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import <UIKit/UIKit.h>

@interface StationLettersCell : UITableViewCell
{
    UILabel *lable_re,*lable_title,*lable_sender,*lable_admi,*lable_rectime,*lable_time,*lable_isRed;
    
    UIButton *delete_btn;
}
@property (nonatomic, strong) UILabel *lable_re,*lable_title,*lable_sender,*lable_adm,*lable_rectime,*lable_time,*lable_isRed;

@property (nonatomic, strong) UIButton *delete_btn;

@end
