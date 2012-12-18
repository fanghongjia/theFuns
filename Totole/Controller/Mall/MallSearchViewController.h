//
//  MallSearchViewController.h
//  Totole
//
//  Created by disan disan on 12-12-9.
//
//

#import <UIKit/UIKit.h>


@interface MallSearchViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource,BgScrollViewDelegate>
{
    
    __unsafe_unretained IBOutlet UIPickerView *pickerView_1;
    __unsafe_unretained IBOutlet UIToolbar *My_toolbar;
    __unsafe_unretained IBOutlet UIPickerView *pickerView_2;
    
    __unsafe_unretained IBOutlet UITextField *key_TF;
    NSMutableArray *allMutArray,*allIDMutArray,*valueMurArray,*valueIDMurArray;
    
    NSString *str_keyword,*str_categoryId,*str_priceId;
    
    NSString *cateStr,*priceStr;
    
    int currentPage;
    
    UITableView *mytableView;
    
    BgScrollView *bgScroll;
    
    NSMutableArray *tempArr;
    
    NSString *recordCount_string;
}

@end
