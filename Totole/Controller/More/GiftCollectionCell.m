//
//  GiftCollectionCell.m
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import "GiftCollectionCell.h"

@implementation GiftCollectionCell

@synthesize lable_11,lable_21,lable_31,lable_32;

@synthesize btn_delete;

@synthesize imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(12, 12, 66, 66)];
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
        imageView.layer.borderColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1].CGColor ;
        [self addSubview:imageView];
        
        lable_11 = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 240, 20)];
        lable_11.text = @"索尼冷死了所发生的";
        lable_11.backgroundColor = [UIColor clearColor];
        lable_11.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:lable_11];
        
        lable_21 = [[UILabel alloc]initWithFrame:CGRectMake(90, 30, 220, 20)];
        lable_21.font = [UIFont systemFontOfSize:15.0];
        lable_21.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_21.backgroundColor = [UIColor clearColor];
        lable_21.text = @"品牌:索尼ljljljljk接口";
        [self addSubview:lable_21];
        
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(90, 55, 10, 17)];
        [imageView1 setImage:[UIImage imageNamed:@"mall_star.png"]];
        [self addSubview:imageView1];
        
        lable_31 = [[UILabel alloc]initWithFrame:CGRectMake(105, 53, 80, 20)];
        lable_31.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
        lable_31.backgroundColor = [UIColor clearColor];
        lable_31.textColor = [UIColor orangeColor];
        lable_31.text = @"205.00";
        [self addSubview:lable_31];
        
        lable_32 = [[UILabel alloc]initWithFrame:CGRectMake(170, 53, 80, 20)];
        lable_32.font = [UIFont systemFontOfSize:15.0];
        lable_32.backgroundColor = [UIColor clearColor];
        lable_32.text = @"积分/对";
        [self addSubview:lable_32];
        
        btn_delete = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_delete.frame = CGRectMake(285, 37, 25, 25);
        [btn_delete setBackgroundImage:[UIImage imageNamed:@"mall_delet.png"] forState:UIControlStateNormal];
        [btn_delete setBackgroundImage:[UIImage imageNamed:@"mall_deletHight.png"] forState:UIControlStateHighlighted];
        [self addSubview:btn_delete];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
