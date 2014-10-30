//
//  SettingsViewController.h
//  Charades
//
//  Created by Rene Candelier on 2/5/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 
@interface SettingsViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate,MFMailComposeViewControllerDelegate>
- (IBAction)feedbackButton:(id)sender;
- (IBAction)home:(id)sender;
- (IBAction)minutesToPlay:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *minutesToPlay;
@property (weak, nonatomic) IBOutlet UITextField *maxScore;

@end

