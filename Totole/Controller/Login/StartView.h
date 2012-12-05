//
//  StartView.h
//  Totole
//
//  Created by jiehua fang on 12-11-25.
//  Copyright (c) 2012年 Hoolai.Lit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StyledPageControl.h"

@protocol StartViewDelegate <NSObject>
@optional
-(void)didStartApp;

@end

@interface StartView : UIView <UIScrollViewDelegate>{
    
    __strong UIScrollView       *_startScrollView;
    __strong StyledPageControl  *_pageControl;

}
@property (nonatomic,unsafe_unretained) NSObject<StartViewDelegate> *delegate;

-(void)statAppEvent:(id)sender;
@end

