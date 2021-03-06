//
//  Mallself.m
//  Totole
//
//  Created by disan disan on 12-12-7.
//
//

#import "MallCell.h"

@implementation MallCell

@synthesize imageView,backView;
@synthesize lable_1,lable_unit,lable_price,stockAmount_lb;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        backView = [[UIView alloc]initWithFrame:CGRectMake(12, 10, 66, 66)];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.masksToBounds = NO;
        backView.layer.shadowColor = [UIColor blackColor].CGColor;
        backView.layer.shadowOffset = CGSizeMake(1, 4);
        backView.layer.shadowOpacity = 0.4;//阴影的透明度
        backView.layer.shadowRadius = 2.5;
        [self.contentView addSubview:backView];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 8, 70, 70)];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 6.0;
        imageView.layer.borderWidth = 1.5;
        imageView.layer.borderColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1].CGColor ;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        
        lable_1 = [[UILabel alloc]initWithFrame:CGRectMake(85, 5, 240, 25)];
        lable_1.backgroundColor = [UIColor clearColor];
        lable_1.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:lable_1];
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(88, 30, 10, 17)];
        [imageView1 setImage:[UIImage imageNamed:@"mall_star.png"]];
        [self addSubview:imageView1];
        
        lable_price = [[UILabel alloc]initWithFrame:CGRectMake(104, 26, 55, 25)];
        lable_price.backgroundColor = [UIColor clearColor];
        lable_price.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        lable_price.textColor = [UIColor orangeColor];
        [self addSubview:lable_price];
        
        
        lable_unit = [[UILabel alloc]initWithFrame:CGRectMake(159, 26, 70, 25)];
        lable_unit.backgroundColor = [UIColor clearColor];
        lable_unit.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
        lable_unit.textColor = [UIColor blackColor];
        [self addSubview:lable_unit];
        
        
        stockAmount_lb = [[UILabel alloc]initWithFrame:CGRectMake(88, 52, 70, 20)];
        stockAmount_lb.backgroundColor = [UIColor clearColor];
        stockAmount_lb.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:13];
        stockAmount_lb.textColor = [UIColor brownColor];
        [self addSubview:stockAmount_lb];
                
        UIImageView *click_imagView = [[UIImageView alloc]initWithFrame:CGRectMake(290,33,9,14)];
        [click_imagView setImage:[UIImage imageNamed:@"mall_click.png"]];
        [self.contentView addSubview:click_imagView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
