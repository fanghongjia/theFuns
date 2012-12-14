//
//  ShoppingCell.m
//  Totole
//
//  Created by disan disan on 12-12-11.
//
//

#import "ShoppingCell.h"

@implementation ShoppingCell

@synthesize imageView,backView;
@synthesize lable_1,lable_unit,lable_price,stockAmount_lb,number_TF;
@synthesize plus_btn,minu_btn,delete_btn;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        backView = [[UIView alloc]initWithFrame:CGRectMake(7, 12, 66, 66)];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.masksToBounds = NO;
        backView.layer.shadowColor = [UIColor blackColor].CGColor;
        backView.layer.shadowOffset = CGSizeMake(1, 4);
        backView.layer.shadowOpacity = 0.4;//阴影的透明度
        backView.layer.shadowRadius = 2.5;
        [self.contentView addSubview:backView];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 70, 70)];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 6.0;
        imageView.layer.borderWidth = 1.5;
        imageView.layer.borderColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1].CGColor ;
        [self.contentView addSubview:imageView];
        
        lable_1 = [[UILabel alloc]initWithFrame:CGRectMake(85, 5, 230, 28)];
        lable_1.backgroundColor = [UIColor clearColor];
        lable_1.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:lable_1];
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(88, 35, 10, 17)];
        [imageView1 setImage:[UIImage imageNamed:@"mall_star.png"]];
        [self addSubview:imageView1];
        
        lable_price = [[UILabel alloc]initWithFrame:CGRectMake(105, 31, 70, 25)];
        lable_price.backgroundColor = [UIColor clearColor];
        lable_price.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
        lable_price.textColor = [UIColor orangeColor];
        [self addSubview:lable_price];
        
        
        lable_unit = [[UILabel alloc]initWithFrame:CGRectMake(175, 31, 70, 25)];
        lable_unit.backgroundColor = [UIColor clearColor];
        lable_unit.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        lable_unit.textColor = [UIColor blackColor];
        [self addSubview:lable_unit];
        
        
        stockAmount_lb = [[UILabel alloc]initWithFrame:CGRectMake(88, 55, 50, 25)];
        stockAmount_lb.backgroundColor = [UIColor clearColor];
        stockAmount_lb.text = @"数量:";
        stockAmount_lb.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        stockAmount_lb.textColor = [UIColor blackColor];
        [self addSubview:stockAmount_lb];
        
        plus_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        plus_btn.frame = CGRectMake(140, 60, 18, 18);
        [plus_btn setBackgroundImage:[UIImage imageNamed:@"activate_plus.png"] forState:UIControlStateNormal];
        [self addSubview:plus_btn];
        
        number_TF = [[UITextField alloc]initWithFrame:CGRectMake(168, 57, 40, 25)];
        number_TF.userInteractionEnabled = NO;
        number_TF.borderStyle = UITextBorderStyleRoundedRect;
        number_TF.backgroundColor = [UIColor whiteColor];
        number_TF.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        number_TF.textColor = [UIColor blackColor];
        number_TF.textAlignment = UITextAlignmentCenter;
        [self addSubview:number_TF];
        
        minu_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        minu_btn.frame = CGRectMake(218, 60, 18, 18);
        [minu_btn setBackgroundImage:[UIImage imageNamed:@"activate_minus.png"] forState:UIControlStateNormal];
        [self addSubview:minu_btn];
        
        delete_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        delete_btn.frame = CGRectMake(270, 40, 25, 25);
        [delete_btn setBackgroundImage:[UIImage imageNamed:@"mall_delet.png"] forState:UIControlStateNormal];
        [delete_btn setBackgroundImage:[UIImage imageNamed:@"mall_deletHight.png"] forState:UIControlStateHighlighted];
        [self addSubview:delete_btn];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
