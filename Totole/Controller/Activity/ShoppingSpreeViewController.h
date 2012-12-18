//
//  ShoppingSpreeViewController.h
//  Totole
//
//  Created by disan disan on 12-12-18.
//
//

#import <UIKit/UIKit.h>

@interface ShoppingSpreeViewController : UIViewController<UIScrollViewDelegate>
{
    __unsafe_unretained IBOutlet UIScrollView *myScrollView;
    __unsafe_unretained IBOutlet UIImageView *head_imagView;
    __unsafe_unretained IBOutlet UILabel *title_lb;
    __unsafe_unretained IBOutlet UILabel *brand_lb;
    
    __unsafe_unretained IBOutlet UILabel *price_lb;
    __unsafe_unretained IBOutlet UILabel *unit_lb;
    __unsafe_unretained IBOutlet UILabel *stockAmount_lb;
    __unsafe_unretained IBOutlet UITextView *detail_textView;
    
    NSString *unit_string;
    
     NSMutableArray *tempArr;
}

//
@property (nonatomic, assign) NSString *str_itemId;

@end
