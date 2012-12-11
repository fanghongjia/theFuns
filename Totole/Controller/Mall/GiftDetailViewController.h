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
    
    NSMutableArray *shoppingArr;
    
    NSString *url_string,*unit_string;
}
@property(unsafe_unretained, nonatomic) NSString *mallId_str;


@end
