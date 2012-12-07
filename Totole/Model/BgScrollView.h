//
//  RequestDataView.h
//  TestSome
//
//  Created by  
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol StateViewDelegate;

#define REFRESH_HEADER_HEIGHT 60.0f
typedef enum{
	Pull0,
	Release0,
	Loading0
}CurrentState0;
@interface StateView : UIView {

	id <StateViewDelegate> __unsafe_unretained delegate;
	CurrentState0 _state;
	
	UILabel *refreshLabel;
	UILabel *lastUpdateLabel;
	UIImageView *refreshArrlow;
	UIActivityIndicatorView *refreshSpinner;


	NSString *textPull;
	NSString *textRelease;
	NSString *textLoading;

	
	BOOL isRefreshHead;//YES:下拉刷新  NO:上拉翻页
}
@property (nonatomic ,unsafe_unretained) id<StateViewDelegate> delegate;
@property (nonatomic, assign) BOOL isRefreshHead;


- (void)setRefreshState:(CurrentState0)state;
- (CurrentState0)currentState;

- (void)pScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)pScrollViewDidEndDragging:(UIScrollView *)scrollView;


- (void)startLoading:(UIScrollView *)scrollView;
- (void)stopLoading:(UIScrollView *)scrollView;
@end

@protocol StateViewDelegate<NSObject>
- (void)requestDataDidStart:(StateView *)requestView;
@end

@protocol BgScrollViewDelegate;
@interface BgScrollView : UIScrollView<UIScrollViewDelegate,StateViewDelegate>
{
	id<BgScrollViewDelegate> __unsafe_unretained BgDelegate;
	StateView *headRefresh;
	StateView *footRefresh;
	NSInteger _type;/*-1:下拉+上拉  0:下拉  1:上拉*/
}
@property (nonatomic ,unsafe_unretained) id<BgScrollViewDelegate> BgDelegate;
//初始化函数
- (id)initWithFrame:(CGRect)frame andType:(NSInteger)type;
//
- (void)refreshViewWithType:(NSInteger)type;
- (void)bgScrollViewDidScroll;
- (void)bgScrollViewDidEndDragging;
//请求回调后一定要调用的两个函数
- (void)stopLoadingUp;
- (void)stopLoadingDown;
@end

@protocol BgScrollViewDelegate<NSObject>
@optional
- (void)startLoadingUp;
- (void)startLoadingDown;

@end



