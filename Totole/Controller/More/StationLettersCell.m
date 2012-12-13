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
        
        lable_re = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 30, 25)];
        lable_re.text = @"Re:";
        [self addSubview:lable_re];
        
        lable_title = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 260, 25)];
        [self addSubview:lable_title];
        
        lable_sender = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 50, 25)];
        lable_sender.text = @"发送者:";
        [self addSubview:lable_sender];
        
        lable_admi = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, 150, 25)];
        lable_admi.text = @"系统管理员";
        [self addSubview:lable_admi];
        
        lable_rectime = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 65, 25)];
        lable_rectime.text = @"接收时间:";
        [self addSubview:lable_rectime];
        
        lable_time = [[UILabel alloc]initWithFrame:CGRectMake(75, 70, 125, 25)];
        [self addSubview:lable_time];
        
        lable_isRed = [[UILabel alloc]initWithFrame:CGRectMake(265, 10, 40, 25)];
        [self addSubview:lable_isRed];
        
        delete_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        delete_btn.frame = CGRectMake(255, 40, 20, 20);
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
