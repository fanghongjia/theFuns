//
//  ActivateViewController.h
//  Totole
//
//  Created by  on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "ZBarSDK.h"


@interface ActivateViewController : UIViewController<ZBarReaderDelegate>
{
    __unsafe_unretained IBOutlet UIImageView *activateResult_View;
//    ZBarReaderController *reader;
}

@end
