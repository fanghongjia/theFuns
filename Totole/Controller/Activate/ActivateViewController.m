//
//  ActivateViewController.m
//  Totole
//
//  Created by  on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ActivateViewController.h"

@implementation ActivateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    
    
    ZBarReaderViewController *reader = [[ZBarReaderViewController alloc]init];

    
    
    UILabel *viewd=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    viewd.alpha = .5;
    viewd.text=@"请将摄像头对准积分卡条码";
    viewd.textAlignment=UITextAlignmentCenter;
    viewd.textColor=[UIColor whiteColor];
    viewd.font=[UIFont systemFontOfSize:16.0];
    viewd.backgroundColor=[UIColor blackColor];
    [reader.view addSubview:viewd];

    
    
    
    reader.readerDelegate = self;
    ZBarImageScanner *scanner = reader.scanner;
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    [self presentModalViewController: reader
                            animated: YES];

}

//二维码代理
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    id<NSFastEnumeration> results =
	[info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    
    NSLog(@"===%@",symbol.data);
    
    
    //扫描所得到的信息  
    NSString *messStr=[symbol.data copy];
    
    //


    [reader dismissModalViewControllerAnimated: YES];
    
}

- (void)viewDidUnload
{
    activateResult_View = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
