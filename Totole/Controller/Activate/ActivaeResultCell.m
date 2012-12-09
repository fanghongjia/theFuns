//
//  ActivaeResultCell.m
//  Totole
//
//  Created by disan disan on 12-12-9.
//
//

#import "ActivaeResultCell.h"

@implementation ActivaeResultCell
@synthesize back_view,number_lb,barcode_lb,state_lb,stateResult_lb;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        back_view = [[UIImageView alloc]initWithFrame:CGRectMake(8, 0, 304, 70)];
        [back_view setImage:[UIImage imageNamed:@"activate_resultRG.png"]];
        [self addSubview:back_view];
        
        number_lb = [[UILabel alloc]initWithFrame:CGRectMake(42, 10, 82, 24)];
        number_lb.backgroundColor = [UIColor clearColor];
        number_lb.text = @"激活号码：";
        number_lb.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:number_lb];
        
        
        state_lb = [[UILabel alloc]initWithFrame:CGRectMake(42, 38, 82, 24)];
        state_lb.backgroundColor = [UIColor clearColor];
        state_lb.text = @"激活状态：";
        state_lb.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:state_lb];
        
        barcode_lb = [[UILabel alloc]initWithFrame:CGRectMake(124, 10, 200, 24)];
        barcode_lb.backgroundColor = [UIColor clearColor];
        barcode_lb.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:barcode_lb];
        
        stateResult_lb = [[UILabel alloc]initWithFrame:CGRectMake(124, 38, 82, 24)];
        stateResult_lb.backgroundColor = [UIColor clearColor];
        stateResult_lb.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:stateResult_lb];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
