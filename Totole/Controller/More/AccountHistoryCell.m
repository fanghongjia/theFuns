//
//  AccountHistoryCell.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "AccountHistoryCell.h"

@implementation AccountHistoryCell

@synthesize lable_11,lable_12,lable_21,lable_22,lable_31,lable_32,lable_41,lable_42,lable_51,lable_52;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        lable_11 = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 40, 20)];
        lable_11.font = [UIFont systemFontOfSize:15.0];
        lable_11.text = @"项目:";
        [self addSubview:lable_11];
        
        lable_12 = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 250, 20)];
        lable_12.font = [UIFont systemFontOfSize:15.0];
        lable_12.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_12.text = @"商城订单";
        [self addSubview:lable_12];
        
        lable_21 = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 40, 20)];
        lable_21.font = [UIFont systemFontOfSize:15.0];
        lable_21.text = @"内容:";
        [self addSubview:lable_21];
        
        lable_22 = [[UILabel alloc]initWithFrame:CGRectMake(50, 25, 240, 20)];
        lable_22.font = [UIFont systemFontOfSize:15.0];
        lable_22.text = @"尼康单反相机:";
        [self addSubview:lable_22];
        
        lable_31 = [[UILabel alloc]initWithFrame:CGRectMake(10, 45, 80, 20)];
        lable_31.font = [UIFont systemFontOfSize:15.0];
        lable_31.text = @"项目单号:";
        [self addSubview:lable_31];
         
        lable_32 = [[UILabel alloc]initWithFrame:CGRectMake(80, 45, 240, 20)];
        lable_32.font = [UIFont systemFontOfSize:15.0];
        lable_32.textColor = [UIColor colorWithRed:164/255.0 green:119/255.0 blue:39/255.0 alpha:1];
        lable_32.text = @"012354489625";
        [self addSubview:lable_32];
        
        lable_41 = [[UILabel alloc]initWithFrame:CGRectMake(10, 65, 40, 20)];
        lable_41.font = [UIFont systemFontOfSize:15.0];
        lable_41.text = @"支出:";
        [self addSubview:lable_41];
        
        lable_42 = [[UILabel alloc]initWithFrame:CGRectMake(50, 65, 240, 20)];
        lable_42.font = [UIFont systemFontOfSize:15.0];
        lable_42.text = @"6464515";
        [self addSubview:lable_42];
        
        lable_51 = [[UILabel alloc]initWithFrame:CGRectMake(10, 85, 40, 20)];
        lable_51.font = [UIFont systemFontOfSize:15.0];
        lable_51.text = @"时间:";
        [self addSubview:lable_51];
        
        lable_52 = [[UILabel alloc]initWithFrame:CGRectMake(50, 85, 240, 20)];
        lable_52.font = [UIFont systemFontOfSize:15.0];
        lable_52.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_52.text = @"2012-02-10";
        [self addSubview:lable_52];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
