//
//  MyOrderCell.m
//  Totole
//
//  Created by disan disan on 12-12-14.
//
//

#import "MyOrderCell.h"

@implementation MyOrderCell

@synthesize lable_11,lable_12,lable_13,lable_21,lable_31,lable_41,lable_42,lable_43,lable_51,lable_52;

@synthesize imageView,backView;
@synthesize btn_Cancel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        lable_11 = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 60, 20)];
        lable_11.font = [UIFont systemFontOfSize:15.0];
        lable_11.backgroundColor = [UIColor clearColor];
        lable_11.text = @"订单号:";
        [self addSubview:lable_11];
        
        lable_12 = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, 200, 20)];
        lable_12.font = [UIFont systemFontOfSize:15.0];
        lable_12.backgroundColor = [UIColor clearColor];
        lable_12.textColor = [UIColor colorWithRed:164/255.0 green:119/255.0 blue:39/255.0 alpha:1];
        lable_12.text = @"RO34354645465";
        [self addSubview:lable_12];
        
        lable_13 = [[UILabel alloc]initWithFrame:CGRectMake(230, 5, 80, 20)];
        lable_13.font = [UIFont systemFontOfSize:15.0];
        lable_13.backgroundColor = [UIColor clearColor];
        lable_13.text = @"配送订单";
        [self addSubview:lable_13];
        
        lable_21 = [[UILabel alloc]initWithFrame:CGRectMake(90, 25, 220, 20)];
        lable_21.font = [UIFont systemFontOfSize:15.0];
        lable_21.backgroundColor = [UIColor clearColor];
        lable_21.text = @"索尼ljljljljk接口";
        [self addSubview:lable_21]; 
        
        lable_31 = [[UILabel alloc]initWithFrame:CGRectMake(90, 45, 200, 20)];
        lable_31.font = [UIFont systemFontOfSize:13.0];
        lable_31.backgroundColor = [UIColor clearColor];
        lable_31.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_31.text = @"单价:565.0 数量:5";
        [self addSubview:lable_31];
        
        lable_41 = [[UILabel alloc]initWithFrame:CGRectMake(90, 65, 40, 20)];
        lable_41.font = [UIFont systemFontOfSize:15.0];
        lable_41.backgroundColor = [UIColor clearColor];
        lable_41.text = @"总价:";
        [self addSubview:lable_41];
        
        
        lable_42 = [[UILabel alloc]initWithFrame:CGRectMake(130, 65, 60, 20)];
        lable_42.font = [UIFont systemFontOfSize:15.0];
        lable_42.backgroundColor = [UIColor clearColor];
        lable_42.text = @"135.00";
        lable_42.textColor = [UIColor orangeColor];
        [self addSubview:lable_42];
        
        lable_43 = [[UILabel alloc]initWithFrame:CGRectMake(180, 65, 120, 20)];
        lable_43.font = [UIFont systemFontOfSize:15.0];
        lable_43.backgroundColor = [UIColor clearColor];
        lable_43.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_43.text = @"来源:商城订单";
        [self addSubview:lable_43];
        
        lable_51 = [[UILabel alloc]initWithFrame:CGRectMake(90, 85, 40, 20)];
        lable_51.font = [UIFont systemFontOfSize:15.0];
        lable_51.backgroundColor = [UIColor clearColor];
        lable_51.text = @"下单:";
        [self addSubview:lable_51];
        
        lable_52 = [[UILabel alloc]initWithFrame:CGRectMake(130, 85, 180, 20)];
        lable_52.font = [UIFont systemFontOfSize:15.0];
        lable_52.backgroundColor = [UIColor clearColor];
        lable_52.textColor = [UIColor colorWithRed:122/255.0 green:130/255.0 blue:146/255.0 alpha:1];
        lable_52.text = @"2012-02-10";
        [self addSubview:lable_52];
        
        btn_Cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_Cancel.frame = CGRectMake(255, 85, 56, 24);
        [btn_Cancel setBackgroundImage:[UIImage imageNamed:@"more_cancel.png"] forState:UIControlStateNormal];
        [self addSubview:btn_Cancel];
        
        
        backView = [[UIView alloc]initWithFrame:CGRectMake(12, 32, 66, 66)];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.masksToBounds = NO;
        backView.layer.shadowColor = [UIColor blackColor].CGColor;
        backView.layer.shadowOffset = CGSizeMake(1, 4);
        backView.layer.shadowOpacity = 0.4;//阴影的透明度
        backView.layer.shadowRadius = 2.5;
        [self.contentView addSubview:backView];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 70, 70)];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 6.0;
        imageView.layer.borderWidth = 1.5;
        imageView.layer.borderColor = [UIColor colorWithRed:247/255.0 green:223/255.0 blue:207/255.0 alpha:1].CGColor ;
//        imageView.layer.shadowColor = [UIColor blackColor].CGColor;
//        imageView.layer.shadowOffset = CGSizeMake(1, 2);
//        imageView.layer.shadowOpacity = 0.2;//阴影的透明度
//        imageView.layer.shadowRadius = 1.5;
        [self addSubview:imageView];
                      }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
