//
//  EndGameViewController.h
//  Charades
//
//  Created by Rene Candelier on 1/30/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndGameViewController : UIViewController

//Labels for Score
@property (weak, nonatomic) IBOutlet UILabel *teamAtotalScore;
@property (weak, nonatomic) IBOutlet UILabel *teamBtotalScore;
//Label for the Winning Team
@property (weak, nonatomic) IBOutlet UILabel *winningTeamLabel;

- (IBAction)rematchButton:(id)sender;

- (IBAction)homeButton:(id)sender;


@end
