//
//  StationLettersCell.m
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import "StationLettersCell.h"

@implementation StationLettersCell

@synthesize lable_re,lable_isRed,lable_rectime,lable_sender,lable_adm,lable_time,lable_title;
@synthesize delete_btn;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        lable_re = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 30, 25)];
        lable_re.text = @"Re:";
        lable_re.textColor = [UIColor orangeColor];
        lable_re.backgroundColor = [UIColor clearColor];
        [self addSubview:lable_re];
        
        lable_title = [[UILabel alloc]initWithFrame:CGRectMake(40, 5, 260, 25)];
        lable_title.backgroundColor = [UIColor clearColor];
        [self addSubview:lable_title];
        
        lable_sender = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 50, 25)];
        lable_sender.backgroundColor = [UIColor clearColor];
        lable_sender.font = [UIFont systemFontOfSize:15.0];
        lable_sender.text = @"发送者:";
        [self addSubview:lable_sender];
        
        lable_admi = [[UILabel alloc]initWithFrame:CGRectMake(60, 30, 150, 25)];
        lable_admi.font = [UIFont systemFontOfSize:15.0];
        lable_admi.backgroundColor = [UIColor clearColor];
        lable_admi.text = @"系统管理员";
        [self addSubview:lable_admi];
        
        lable_rectime = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 65, 25)];
        lable_rectime.font = [UIFont systemFontOfSize:15.0];
        lable_rectime.backgroundColor = [UIColor clearColor];
        lable_rectime.text = @"接收时间:";
        [self addSubview:lable_rectime];
        
        lable_time = [[UILabel alloc]initWithFrame:CGRectMake(75, 50, 125, 25)];
        lable_time.font = [UIFont systemFontOfSize:15.0];
        lable_time.backgroundColor = [UIColor clearColor];
        [self addSubview:lable_time];
        
        lable_isRed = [[UILabel alloc]initWithFrame:CGRectMake(265, 5, 40, 25)];
        lable_isRed.backgroundColor = [UIColor clearColor];
        [self addSubview:lable_isRed];
        
        delete_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        delete_btn.frame = CGRectMake(265, 30, 25, 25);
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
