//
//  AnnouncementCell.m
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import "AnnouncementCell.h"

@implementation AnnouncementCell

@synthesize lable_11,lable_21;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        lable_11 = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 260, 20)];
        lable_11.font = [UIFont systemFontOfSize:15.0];
        lable_11.backgroundColor = [UIColor clearColor];
        lable_11.text = @"保罗单反相机包公告";
        [self addSubview:lable_11];
        
        
        lable_21 = [[UILabel alloc]initWithFrame:CGRectMake(10, 25, 90, 20)];
        lable_21.font = [UIFont systemFontOfSize:15.0];
        lable_21.backgroundColor = [UIColor clearColor];
        lable_21.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_21.text = @"2012-12-16";
        [self addSubview:lable_21];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
