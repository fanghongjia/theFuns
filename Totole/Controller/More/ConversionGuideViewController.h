//
//  ConversionGuideViewController.h
//  Totole
//
//  Created by disan disan on 12-12-13.
//
//

#import <UIKit/UIKit.h>

@interface ConversionGuideViewController : UIViewController<UIWebViewDelegate>
{
    
    __unsafe_unretained IBOutlet UIWebView *guidImageWebView;
    
    NSURL *url;
    
    UIActivityIndicatorView *activityIndicatorView;
}

@end
