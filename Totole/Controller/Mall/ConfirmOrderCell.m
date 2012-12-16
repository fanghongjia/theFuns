//
//  ConfirmOrderCell.m
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import "ConfirmOrderCell.h"

@implementation ConfirmOrderCell

@synthesize lable_1,lable_price,lable_unit,lable_count;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        
        lable_1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 275, 28)];
        lable_1.backgroundColor = [UIColor clearColor];
        lable_1.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:lable_1];
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(13, 35, 10, 17)];
        [imageView1 setImage:[UIImage imageNamed:@"mall_star.png"]];
        [self addSubview:imageView1];
        
        lable_price = [[UILabel alloc]initWithFrame:CGRectMake(30, 31, 70, 25)];
        lable_price.backgroundColor = [UIColor clearColor];
        lable_price.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
        lable_price.textColor = [UIColor orangeColor];
        [self addSubview:lable_price];
        
        
        lable_unit = [[UILabel alloc]initWithFrame:CGRectMake(100, 31, 70, 25)];
        lable_unit.backgroundColor = [UIColor clearColor];
        lable_unit.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        lable_unit.textColor = [UIColor blackColor];
        [self addSubview:lable_unit];
        
        lable_count = [[UILabel alloc]initWithFrame:CGRectMake(200, 31, 70, 25)];
        lable_unit.backgroundColor = [UIColor clearColor];
        lable_unit.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        lable_unit.textColor = [UIColor blackColor];
        [self addSubview:lable_unit];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
