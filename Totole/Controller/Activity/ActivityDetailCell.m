//
//  ActivityDetailCell.m
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import "ActivityDetailCell.h"

@implementation ActivityDetailCell

@synthesize lable_11,lable_21,lable_22,lable_31,lable_41;

@synthesize imageView;

@synthesize backView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        backView = [[UIView alloc]initWithFrame:CGRectMake(12, 12, 66, 66)];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.masksToBounds = NO;
        backView.layer.shadowColor = [UIColor blackColor].CGColor;
        backView.layer.shadowOffset = CGSizeMake(1, 4);
        backView.layer.shadowOpacity = 0.4;//阴影的透明度
        backView.layer.shadowRadius = 2.5;
        [self.contentView addSubview:backView];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 70)];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 6.0;
        imageView.layer.borderWidth = 1.5;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.layer.borderColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1].CGColor ;
        [self.contentView addSubview:imageView];
        
        lable_11 = [[UILabel alloc]initWithFrame:CGRectMake(90, 5, 220, 20)];
        lable_11.font = [UIFont systemFontOfSize:15.0];
        lable_11.backgroundColor = [UIColor clearColor];
        lable_11.text = @"保罗单反相机包";
        [self addSubview:lable_11];
        
        
        lable_21 = [[UILabel alloc]initWithFrame:CGRectMake(90, 25, 90, 20)];
        lable_21.font = [UIFont systemFontOfSize:15.0];
        lable_21.backgroundColor = [UIColor clearColor];
        lable_21.text = @"秒杀积分:";
        [self addSubview:lable_21];
        
        lable_22 = [[UILabel alloc]initWithFrame:CGRectMake(180, 25, 110, 20)];
        lable_22.font = [UIFont boldSystemFontOfSize:15.0];
        lable_22.backgroundColor = [UIColor clearColor];
        lable_22.textColor = [UIColor orangeColor];
        lable_22.text = @"233.00";
        [self addSubview:lable_22];
        
        lable_31 = [[UILabel alloc]initWithFrame:CGRectMake(90, 45, 200, 20)];
        lable_31.font = [UIFont systemFontOfSize:15.0];
        lable_31.backgroundColor = [UIColor clearColor];
        lable_31.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_31.text = @"原积分123.00";
        [self addSubview:lable_31];
        
        
        lable_41 = [[UILabel alloc]initWithFrame:CGRectMake(90, 65, 200, 20)];
        lable_41.font = [UIFont systemFontOfSize:13.0];
        lable_41.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_41.backgroundColor = [UIColor clearColor];
        lable_41.text = @"库存:2台";
        [self addSubview:lable_41];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
