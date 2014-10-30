//
//  TimesUpViewController.h
//  Charades
//
//  Created by Rene Candelier on 1/30/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimesUpViewController : UIViewController
- (IBAction)nextTeam:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *teamsTurn;
@property (weak, nonatomic) IBOutlet UILabel *teamBscoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *teamAscoreLabel;



@end
