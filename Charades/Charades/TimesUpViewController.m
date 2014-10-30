//
//  TimesUpViewController.m
//  Charades
//
//  Created by Rene Candelier on 1/30/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "TimesUpViewController.h"
#import "CharadesActionView.h"
#import "StartView.h"
#import "TeamInfo.h"
#import "Store.h"

@interface TimesUpViewController ()

@end

@implementation TimesUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
   
    //Get Team Score and Team's Turn
    Store *TeamTurn = [Store sharedStore];
    
    //Set button with teams turn
    [self.teamsTurn setTitle:TeamTurn.Team forState:UIControlStateNormal];
    
    //display the text for the score labels
    
    //Team A Score
    if(!TeamTurn.TeamA){
        self.teamAscoreLabel.text = @"0";;
    }else{
        self.teamAscoreLabel.text = TeamTurn.TeamA;
    }
    //Team A Score 
    if(!TeamTurn.TeamB){
        self.teamBscoreLabel.text = @"0";;
    }else{
        self.teamBscoreLabel.text = TeamTurn.TeamB;
    }
    
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextTeam:(id)sender{
    CharadesActionView *PickItem = [self.storyboard instantiateViewControllerWithIdentifier:@"pickItem"];
    
    [self.navigationController pushViewController:PickItem animated:YES];
    [self presentViewController:PickItem animated:YES completion:nil];

    
}
@end
