//
//  MyboxCell.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "MyboxCell.h"

@implementation MyboxCell

@synthesize lable_name,lable_score,lable_size,lable_number,lable_source,lable_title,lable_valid,lable_time;
@synthesize button_use;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        lable_name = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 80, 25)];
        lable_name.text = @"宝物名称:";
        lable_name.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:lable_name];
        
        lable_score = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 90, 25)];
        lable_score.font = [UIFont systemFontOfSize:15.0];
        lable_score.textColor = [UIColor orangeColor];
        lable_score.text = @"+10";
        [self addSubview:lable_score];
        
        lable_size = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 50, 25)];
        lable_size.font = [UIFont systemFontOfSize:15.0];
        lable_size.text = @"号码:";
        [self addSubview:lable_size];
        
        lable_number = [[UILabel alloc]initWithFrame:CGRectMake(50, 25, 220, 25)];
        lable_number.font = [UIFont systemFontOfSize:15.0];
        lable_number.textColor = [UIColor colorWithRed:164/255.0 green:119/255.0 blue:39/255.0 alpha:1];
        lable_number.text = @"RTB6546464651615";
        [self addSubview:lable_number];
        
        lable_source = [[UILabel alloc]initWithFrame:CGRectMake(10, 45, 50, 25)];
        lable_source.font = [UIFont systemFontOfSize:15.0];
        lable_source.text = @"来源:";
        [self addSubview:lable_source];
        
        
        lable_title = [[UILabel alloc]initWithFrame:CGRectMake(50, 45, 220, 25)];
        lable_title.font = [UIFont systemFontOfSize:15.0];
        lable_title.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_title.text = @"一天一好运";//122 130 146
        [self addSubview:lable_title];
        
        lable_valid = [[UILabel alloc]initWithFrame:CGRectMake(10, 65, 80, 25)];
        lable_valid.font = [UIFont systemFontOfSize:15.0];
        lable_valid.text = @"有效期:";
        [self addSubview:lable_valid];
        
        lable_time = [[UILabel alloc]initWithFrame:CGRectMake(63, 65, 180, 25)];
        lable_time.font = [UIFont systemFontOfSize:15.0];
        lable_time.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_time.text = @"2010-12-13";
        [self addSubview:lable_time];
        
        button_use = [UIButton buttonWithType:UIButtonTypeCustom];
        button_use.frame = CGRectMake(220, 30, 67, 29);
        [button_use setBackgroundImage:[UIImage imageNamed:@"more_ues.png"] forState:UIControlStateNormal];
        [self addSubview:button_use];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
