//
//  MmUtil.h
//  Haoledi
//
//  Created by zhangcc on 12-12-3.
//
//

#import <Foundation/Foundation.h>
#import "EGOImageView.h"
@interface MmUtil : NSObject
+ (EGOImageView *)loadUserHeadface: (NSString *)headface;
+ (EGOImageView *)loadWebImage: (NSString *)imageUrl placeholderImage: (NSString *)placeholderImageName;
@end
