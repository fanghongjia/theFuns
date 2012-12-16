//
//  GiftCollectionCell.h
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import <UIKit/UIKit.h>

@interface GiftCollectionCell : UITableViewCell
{
    UILabel *lable_11,*lable_21,*lable_31,*lable_32;
    
    UIImageView *imageView;
    
    UIButton *btn_delete;
}

@property (nonatomic, strong) UILabel *lable_11,*lable_21,*lable_31,*lable_32;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *btn_delete;

@end
