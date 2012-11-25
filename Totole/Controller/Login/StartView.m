//
//  StartView.m
//  Totole
//
//  Created by jiehua fang on 12-11-25.
//  Copyright (c) 2012年 Hoolai.Lit. All rights reserved.
//

#import "StartView.h"

@implementation StartView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        startScrollView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [startScrollView setContentSize:CGSizeMake([[UIScreen mainScreen]bounds].size.width*3, [[UIScreen mainScreen]bounds].size.height)];
        [self addSubview:startScrollView];
        
        
    }
    return self;
}

@end
