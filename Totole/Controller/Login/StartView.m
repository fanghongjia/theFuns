//
//  StartView.m
//  Totole
//
//  Created by jiehua fang on 12-11-25.
//  Copyright (c) 2012年 Hoolai.Lit. All rights reserved.
//

#import "StartView.h"

@implementation StartView
@synthesize delegate=_delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        
        _startScrollView = [[UIScrollView alloc]initWithFrame:frame];
        [_startScrollView setContentSize:CGSizeMake(frame.size.width*3, frame.size.height)];  
        [_startScrollView setPagingEnabled:YES];
        _startScrollView.delegate = self;
        [_startScrollView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:_startScrollView];
        
        for (int i=0; i<3; i++)
        {
            CGRect vFrame = CGRectMake(frame.size.width*i, 0, frame.size.width, frame.size.height);
            UIImageView *adView = [[UIImageView alloc]initWithFrame:vFrame];
            [adView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"firstLogin_%d.png",i+1]]];
            if (i==2)
            {
                UIImage *starimg = [UIImage imageNamed:@"stare_experience.png"];
                UIButton *starBtn = [[UIButton alloc]initWithFrame:CGRectMake(192/2, 763/2, starimg.size.width/2, starimg.size.height/2)];
                [starBtn setImage:starimg forState:UIControlStateNormal];
                [starBtn addTarget:self action:@selector(statAppEvent:) forControlEvents:UIControlEventTouchUpInside];
                [adView setUserInteractionEnabled:YES];
                [adView addSubview:starBtn];
            }
            
            [_startScrollView addSubview:adView];
            
            
            
        }
        
        _pageControl = [[StyledPageControl alloc] initWithFrame:CGRectMake(6, (self.frame.size.height-35), self.frame.size.width, 20)];
        [_pageControl setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [_pageControl setPageControlStyle:PageControlStyleThumb];
        [_pageControl setThumbImage:[UIImage imageNamed:@"pageControIcon_disable@2x.png"]];
        [_pageControl setSelectedThumbImage:[UIImage imageNamed:@"pageControIcon_enable@2x.png"]];
        [_pageControl setNumberOfPages:3];
        [self addSubview:_pageControl];
        

    }
    return self;
}
#pragma mark - 
#pragma mark scrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageNum = scrollView.contentOffset.x/self.frame.size.width;
    [_pageControl setCurrentPage:pageNum];
    
}

#pragma mark - 
#pragma mark button事件
-(void)statAppEvent:(id)sender{
    if (self.delegate) {
        [self.delegate didStartApp];
    }
}
@end
