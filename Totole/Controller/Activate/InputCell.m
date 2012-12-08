//
//  InputCell.m
//  Totole
//
//  Created by disan disan on 12-12-8.
//
//

#import "InputCell.h"

@implementation InputCell

@synthesize input_btn, input_TF;
@synthesize isAdd;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        input_TF = [[UITextField alloc]initWithFrame:CGRectMake(30, 0, 220, 31)];
        input_TF.borderStyle = UITextBorderStyleRoundedRect;
        input_TF.keyboardType = UIKeyboardTypeNumberPad;
        input_TF.backgroundColor = [UIColor whiteColor];
        [self addSubview:input_TF];
        
        input_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        input_btn.frame = CGRectMake(260, 6, 18, 18);
        [input_btn setBackgroundImage:[UIImage imageNamed:@"activate_plus.png"] forState:UIControlStateNormal];
        [self addSubview:input_btn];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [input_btn release];
    [input_TF release];
    
    [super dealloc];
}

@end
