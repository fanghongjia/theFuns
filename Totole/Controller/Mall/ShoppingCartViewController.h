//
//  ShoppingCartViewController.h
//  Totole
//
//  Created by disan disan on 12-12-10.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ShoppingCartViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mytableView;
    NSMutableArray *shopMutArr;
    __unsafe_unretained IBOutlet UIView *headView;
    
    int row;
}

@end
