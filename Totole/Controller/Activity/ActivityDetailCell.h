//
//  ActivityDetailCell.h
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import <UIKit/UIKit.h>

@interface ActivityDetailCell : UITableViewCell
{
    UIImageView *imageView;
    UIView *backView;
    UILabel *lable_11,*lable_21,*lable_22,*lable_31,*lable_41;
}
@property (nonatomic, strong) UILabel *lable_11,*lable_21,*lable_22,*lable_31,*lable_41;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIView *backView;

@end
