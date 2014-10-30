//
//  ViewController.h
//  Charades
//
//  Created by Rene Candelier on 2/5/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"

@interface ViewController : UIViewController<EAIntroDelegate>
- (IBAction)startIntro:(id)sender;

@end
