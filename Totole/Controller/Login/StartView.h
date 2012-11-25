//
//  StartView.h
//  Totole
//
//  Created by jiehua fang on 12-11-25.
//  Copyright (c) 2012年 Hoolai.Lit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StyledPageControl.h"

@interface StartView : UIView <UIScrollViewDelegate>{
    
    __strong UIScrollView       *startScrollView;
    __strong StyledPageControl  *pageControl;
    
}

@end
