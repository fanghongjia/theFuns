//
//  RequestDataView.m
//  TestSome
//
//  Created by  
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BgScrollView.h"
#import <QuartzCore/QuartzCore.h>

@implementation StateView
@synthesize isRefreshHead;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		CGRect rect = self.frame;
        // Initialization code.
		self.backgroundColor = [UIColor clearColor];
		textPull = [[NSString alloc] initWithString:NSLocalizedString(@"上拉刷新...",@"")];
		textRelease = [[NSString alloc] initWithString:NSLocalizedString(@"松开即可刷新...",@"")];
		textLoading = [[NSString alloc] initWithString:NSLocalizedString(@"加载中...", nil)];

		//刷新文字
		refreshLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, self.frame.size.height)];
		refreshLabel.font = [UIFont boldSystemFontOfSize:13];
		refreshLabel.textColor = [UIColor grayColor];
		refreshLabel.textAlignment = UITextAlignmentCenter;
		refreshLabel.backgroundColor = [UIColor clearColor];
		
		//刷新时间
		lastUpdateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2, 320, self.frame.size.height/2)];
		lastUpdateLabel.font = [UIFont boldSystemFontOfSize:12];
		lastUpdateLabel.textColor = [UIColor lightGrayColor];
		lastUpdateLabel.textAlignment = UITextAlignmentCenter ;
		lastUpdateLabel.backgroundColor = [UIColor clearColor];
		
		CGRect arrowFrame = CGRectMake((REFRESH_HEADER_HEIGHT - 23) / 2,
									   (REFRESH_HEADER_HEIGHT - 36) / 2,
									   23, 36);
		refreshArrlow = [[UIImageView alloc] initWithFrame:arrowFrame];
		refreshArrlow.image = [UIImage imageNamed:@"down_arrow"];
		
		refreshSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		refreshSpinner.frame = CGRectMake((REFRESH_HEADER_HEIGHT - 20) / 2, (REFRESH_HEADER_HEIGHT - 20) / 2, 20, 20);
		refreshSpinner.hidesWhenStopped = YES;
		
		refreshLabel.text = textPull;
		lastUpdateLabel.hidden = YES;
		
		//最后更新时间初始化
		NSString *timeStr = [[NSUserDefaults standardUserDefaults]  objectForKey:@"EGORefreshTableView_LastRefresh"];
		if ([timeStr length] <= 0) {
			//第一次装程序 没有最后刷新时间 给一个默认是的当前时间
			NSDate *date = [NSDate date];
			NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
			[formatter setAMSymbol:@"AM"];
			[formatter setPMSymbol:@"PM"];
			[formatter setDateFormat:NSLocalizedString(@"MM/dd/yyyy hh:mm",nil)];
			lastUpdateLabel.text = [NSString stringWithFormat:@"上次更新: %@", [formatter stringFromDate:date]];
			[[NSUserDefaults standardUserDefaults] setObject:lastUpdateLabel.text forKey:@"EGORefreshTableView_LastRefresh"];
			[[NSUserDefaults standardUserDefaults] synchronize];
		}else {
			lastUpdateLabel.text = timeStr;
		}

		
		//下拉刷新
		if (rect.origin.y < 0) {
			lastUpdateLabel.hidden = NO;
			refreshLabel.frame = CGRectMake(0, 5, 320, self.frame.size.height/2-5);
			lastUpdateLabel.frame = CGRectMake(0, self.frame.size.height/2, 320, self.frame.size.height/2-10);
			
		    //在底部加一条线
			UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, 320, 0.5)];
			lineView.backgroundColor = [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1];
			[self addSubview:lineView];
		}
		
		[self addSubview:refreshLabel];
		[self addSubview:refreshArrlow];
		[self addSubview:refreshSpinner];
		[self addSubview:lastUpdateLabel];
	}
    return self;
}
- (CurrentState0)currentState{
	return _state;
}
- (void)setRefreshState:(CurrentState0)state{

	_state = state;
	if (state == Pull0) {
		[UIView beginAnimations:@"arrow" context:NULL];
		refreshLabel.text = textPull;
		[refreshArrlow layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
		[UIView commitAnimations];
	}
	else if(state == Release0){
		[UIView beginAnimations:@"arrow" context:NULL];
		refreshLabel.text = textRelease ;
		[refreshArrlow layer].transform =CATransform3DMakeRotation(M_PI, 0, 0, 1);
		[UIView commitAnimations];
	}
	else if(state == Loading0){
		refreshLabel.text = textLoading;
	}
}
- (void)startLoading:(UIScrollView *)scrollView{
	_state = Loading0;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	
	if (isRefreshHead) {
		scrollView.contentInset = UIEdgeInsetsMake(REFRESH_HEADER_HEIGHT, 0, 0, 0);
	}
	else {
		scrollView.contentInset = UIEdgeInsetsMake(0,0, REFRESH_HEADER_HEIGHT, 0);
	}
	refreshLabel.text = textLoading ;
	refreshArrlow.hidden = YES ;
	[refreshSpinner startAnimating];
	[UIView commitAnimations];
	
	if (delegate && [delegate respondsToSelector:@selector(requestDataDidStart:)]) {
		[delegate requestDataDidStart:self];
	}
}
- (void)stopLoading:(UIScrollView *)scrollView{
	if (_state != Loading0) {
		return;
	}
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDidStopSelector:@selector(stopLoadingComplete:finished:context:)];
	scrollView.contentInset = UIEdgeInsetsZero;
	[refreshArrlow layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
	
	[UIView commitAnimations];
	
	if (isRefreshHead) {
		//更改更新时间
		NSDate *date = [NSDate date];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setAMSymbol:@"AM"];
		[formatter setPMSymbol:@"PM"];
		[formatter setDateFormat:NSLocalizedString(@"MM/dd/yyyy hh:mm",nil)];
		lastUpdateLabel.text = [NSString stringWithFormat:@"上次更新: %@", [formatter stringFromDate:date]];
		[[NSUserDefaults standardUserDefaults] setObject:lastUpdateLabel.text forKey:@"EGORefreshTableView_LastRefresh"];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
}
- (void)stopLoadingComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	
	//Reset the header
	_state = Pull0;
	refreshLabel.text = textPull;
	refreshArrlow.hidden = NO;
	[refreshSpinner stopAnimating];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/
- (void)pScrollViewDidScroll:(UIScrollView *)scrollView{
	
	if (isRefreshHead) {
		if (_state == Loading0) {
			//if (scrollView.contentOffset.y > 0) {
//				scrollView.contentInset = UIEdgeInsetsZero ;
//			}else if (scrollView.contentOffset.y >= -REFRESH_HEADER_HEIGHT) {
//				scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//			}
		}
		else if(scrollView.dragging == YES && scrollView.contentOffset.y < 0){
			if (scrollView.contentOffset.y < -REFRESH_HEADER_HEIGHT) {
				[self setRefreshState:Release0];
			}
			else{
				[self setRefreshState:Pull0];
			}
		}
	}
	else {
		if (_state == Loading0) {
			//int y = scrollView.contentOffset.y;
//			if (y < scrollView.contentSize.height - scrollView.frame.size.height) {
//				scrollView.contentInset = UIEdgeInsetsZero;
//			}
//			else if(y < scrollView.contentSize.height - scrollView.frame.size.height + REFRESH_HEADER_HEIGHT){
//				scrollView.contentInset = UIEdgeInsetsMake(-y,0,0,0);
//			}
		}
		else {
			int y = scrollView.contentOffset.y;
			if (scrollView.dragging == YES && y > scrollView.contentSize.height - scrollView.frame.size.height) {
				
				if (y > scrollView.contentSize.height - scrollView.frame.size.height + REFRESH_HEADER_HEIGHT) {
					
					[self setRefreshState:Release0];
				}
				else{
					[self setRefreshState:Pull0];
				} 
			}
		}
	}
}

- (void)pScrollViewDidEndDragging:(UIScrollView *)scrollView{
	if (isRefreshHead) {
		if (_state == Loading0) {
			return;
		}
		if (scrollView.contentOffset.y < -REFRESH_HEADER_HEIGHT) {
			[self startLoading:scrollView];
		}
	}
	else {
		if (_state == Loading0) {
			return;
		}
		int y = scrollView.contentOffset.y;
		if (y > scrollView.contentSize.height - scrollView.frame.size.height + REFRESH_HEADER_HEIGHT) {
			[self startLoading:scrollView];
		}
	}
}


@end

@implementation BgScrollView
@synthesize BgDelegate;
- (id)initWithFrame:(CGRect)frame andType:(NSInteger)type{
	self = [super initWithFrame:frame];
	if (self) {
		_type = type;
		headRefresh = nil;
		footRefresh = nil;
		if (type == -1) {
			headRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,-REFRESH_HEADER_HEIGHT,320,REFRESH_HEADER_HEIGHT)];
			headRefresh.isRefreshHead = YES;
			headRefresh.delegate = self;
			[self addSubview:headRefresh];
			
			footRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,frame.size.height-REFRESH_HEADER_HEIGHT+1,320,REFRESH_HEADER_HEIGHT)];
			footRefresh.isRefreshHead = NO;
			footRefresh.delegate = self;
			[self addSubview:footRefresh];
		}
		else if(type == 0){
			headRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,-REFRESH_HEADER_HEIGHT,320,REFRESH_HEADER_HEIGHT)];
			headRefresh.isRefreshHead = YES;
			headRefresh.delegate = self;
			[self addSubview:headRefresh];
		}
		else if(type == 1){
			footRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,frame.size.height-REFRESH_HEADER_HEIGHT+1,320,REFRESH_HEADER_HEIGHT)];
			footRefresh.isRefreshHead = NO;
			footRefresh.delegate = self;
			[self addSubview:footRefresh];
		}
	}
	return self;
}
- (void)bgScrollViewDidScroll{
	
	if (headRefresh != nil) {
		[headRefresh pScrollViewDidScroll:self];
	}
	if (footRefresh != nil) {
		[footRefresh pScrollViewDidScroll:self];
	}
}
- (void)bgScrollViewDidEndDragging{
	if (headRefresh != nil) {
		[headRefresh pScrollViewDidEndDragging:self];
	}
	if (footRefresh != nil) {
		[footRefresh pScrollViewDidEndDragging:self];
	}
}

- (void)refreshViewWithType:(NSInteger)type{
	_type = type;
	
	if (headRefresh != nil) {
		[headRefresh removeFromSuperview];
		headRefresh = nil;
	}
	if (footRefresh != nil) {
		[footRefresh removeFromSuperview];
		footRefresh = nil;
	}
//	if (type == -1) {
		headRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,-REFRESH_HEADER_HEIGHT,320,REFRESH_HEADER_HEIGHT)];
		headRefresh.isRefreshHead = YES;
		headRefresh.delegate = self;
		[self addSubview:headRefresh];
//		
//		footRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,self.frame.size.height-REFRESH_HEADER_HEIGHT+1,320,REFRESH_HEADER_HEIGHT)];
//		footRefresh.isRefreshHead = NO;
//		footRefresh.delegate = self;
//		[self addSubview:footRefresh];
//	}
//	else if(type == 0){
//		
//		headRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,-REFRESH_HEADER_HEIGHT,320,REFRESH_HEADER_HEIGHT)];
//		headRefresh.isRefreshHead = YES;
//		headRefresh.delegate = self;
//		[self addSubview:headRefresh];
//    
//        footRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,self.frame.size.height-REFRESH_HEADER_HEIGHT+1,320,REFRESH_HEADER_HEIGHT)];
//        footRefresh.isRefreshHead = NO;
//        footRefresh.delegate = self;
//        [self addSubview:footRefresh];
//	}
//	else if(type == 1){
//		footRefresh = [[StateView alloc] initWithFrame:CGRectMake(0,self.frame.size.height-REFRESH_HEADER_HEIGHT+1,320,REFRESH_HEADER_HEIGHT)];
//		footRefresh.isRefreshHead = NO;
//		footRefresh.delegate = self;
//		[self addSubview:footRefresh];
//	}
}
- (void)stopLoadingUp{
	if (headRefresh != nil) {
		[headRefresh stopLoading:self];
	}
}
- (void)stopLoadingDown{
	if (footRefresh != nil) {
		[footRefresh stopLoading:self];
	}
}
#pragma mark -
#pragma mark RequestDataViewDelegate
- (void)requestDataDidStart:(StateView *)requestView{
	if (requestView == headRefresh) {
		if (BgDelegate && [BgDelegate respondsToSelector:@selector(startLoadingUp)]) {
			[BgDelegate startLoadingUp];
		}
	}
	else {
		if (BgDelegate && [BgDelegate respondsToSelector:@selector(startLoadingDown)]) {
			[BgDelegate startLoadingDown];
		}
	}
}

@end

