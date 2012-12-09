//
//  GiftDetailViewController.h
//  Totole
//
//  Created by disan disan on 12-12-7.
//
//

#import <UIKit/UIKit.h>

@interface GiftDetailViewController : UIViewController
{
    __unsafe_unretained IBOutlet UIScrollView *myScrollView;
    __unsafe_unretained IBOutlet UIImageView *head_imagView;
    __unsafe_unretained IBOutlet UILabel *title_lb;
    __unsafe_unretained IBOutlet UILabel *brand_lb;
    
    __unsafe_unretained IBOutlet UILabel *price_lb;
    __unsafe_unretained IBOutlet UILabel *unit_lb;
    __unsafe_unretained IBOutlet UILabel *stockAmount_lb;
    __unsafe_unretained IBOutlet UITextView *detail_textView;
}
@property(unsafe_unretained, nonatomic) NSString *mallId_str;
@property(unsafe_unretained, nonatomic) NSString *title_str;
@property(unsafe_unretained, nonatomic) NSString *brand_str;
@property(unsafe_unretained, nonatomic) NSString *price_str;
@property(unsafe_unretained, nonatomic) NSString *unit_str;
@property(unsafe_unretained, nonatomic) NSString *stockAmoun_str;

@end
