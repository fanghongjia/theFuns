//
//  ConfirmOrderViewController.h
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import <UIKit/UIKit.h>

@interface ConfirmOrderViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UITableView *mytableView;
    NSMutableArray *shopMutArr;
    __unsafe_unretained IBOutlet UIView *foot_view;
    
}

@end
