//
//  ActivityDetailViewController.h
//  Totole
//
//  Created by disan disan on 12-12-16.
//
//

#import <UIKit/UIKit.h>

@interface ActivityDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
      UITableView *mytableView;
    __unsafe_unretained IBOutlet UIImageView *topView;
}


@end
