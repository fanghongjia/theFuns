//
//  MmUtil.m
//  Haoledi
//
//  Created by zhangcc on 12-12-3.
//
//

#import "MmUtil.h"

@implementation MmUtil
+ (EGOImageView *)loadUserHeadface: (NSString *)headface
{
    NSString *url = headface;
    return [self loadWebImage:url placeholderImage:@"search_10"];
}


+ (EGOImageView *)loadWebImage: (NSString *)imageUrl placeholderImage: (NSString *)placeholderImageName
{
    EGOImageView *iv = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:placeholderImageName]];
    iv.imageURL = [NSURL URLWithString:imageUrl];
    return iv;
}
@end
