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
    NSInteger cellTag;
}

@property (nonatomic, strong) UIButton *input_btn;
@property (nonatomic, strong) UITextField *input_TF;
@property (nonatomic, assign) BOOL isAdd;
@property (nonatomic, assign) NSInteger cellTag;

@end
