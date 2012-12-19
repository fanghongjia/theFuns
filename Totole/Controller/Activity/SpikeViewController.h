//
//  SpikeViewController.h
//  Totole
//
//  Created by disan disan on 12-12-19.
//
//

#import <UIKit/UIKit.h>

@interface SpikeViewController : UIViewController
{
    
    __unsafe_unretained IBOutlet UIScrollView *myScrollView;
    __unsafe_unretained IBOutlet UIImageView *head_imagView;
    __unsafe_unretained IBOutlet UITextView *detail_textView;
    __unsafe_unretained IBOutlet UILabel *label_11;
    __unsafe_unretained IBOutlet UILabel *label_21;
    __unsafe_unretained IBOutlet UILabel *label_31;
    __unsafe_unretained IBOutlet UILabel *label_32;
    __unsafe_unretained IBOutlet UILabel *label_41;
    
    
    NSString *unit_string;
}

@property (nonatomic, assign) NSString *str_itemId;

@end
