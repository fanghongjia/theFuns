//
//  InputCell.h
//  Totole
//
//  Created by disan disan on 12-12-8.
//
//

#import <UIKit/UIKit.h>

@interface InputCell : UITableViewCell
{
    UIButton *input_btn;
    UITextField *input_TF;
    BOOL isAdd;         // 加号
}

@property (nonatomic, retain) UIButton *input_btn;
@property (nonatomic, retain) UITextField *input_TF;
@property (nonatomic, assign) BOOL isAdd;

@end
