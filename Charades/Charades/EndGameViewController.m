//
//  EndGameViewController.m
//  Charades
//
//  Created by Rene Candelier on 1/30/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "EndGameViewController.h"
#import "CharadesActionView.h"
#import "Store.h"
#import "CharadesViewController.h"

@interface EndGameViewController ()

@end

@implementation EndGameViewController

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
	// Get Values from Store
    Store *ScoreVaulue =[Store sharedStore];
    //Convert string values to integers
   int ScoreForTeamA = [ScoreVaulue.TeamA intValue];
    int ScoreForTeamB = [ScoreVaulue.TeamB intValue];
    //Increase by One
    ScoreForTeamA++;
    ScoreForTeamB++;
   
    if (ScoreForTeamA>ScoreForTeamB) {
        self.winningTeamLabel.text=@"Team A Wins!";
        
        NSString *TotalScoreForTeamA = [NSString stringWithFormat:@"%d",ScoreForTeamA];
        //Display values for Team A
        self.teamAtotalScore.text =TotalScoreForTeamA;
        //Display Value for Team B
        self.teamBtotalScore.text = ScoreVaulue.TeamB;

    }else{
        self.winningTeamLabel.text=@"Team B Wins!";
        
        NSString *TotalScoreForTeamB = [NSString stringWithFormat:@"%d",ScoreForTeamB];
        //Display values for Team A
        self.teamBtotalScore.text =TotalScoreForTeamB;
        //Display Value for Team A
        self.teamAtotalScore.text = ScoreVaulue.TeamA;
    }
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rematchButton:(id)sender {
    [self ZeroValue];
    CharadesActionView *PickItem = [self.storyboard instantiateViewControllerWithIdentifier:@"pickItem"];
    
    [self.navigationController pushViewController:PickItem animated:YES];
    [self presentViewController:PickItem animated:YES completion:nil];
}

- (IBAction)homeButton:(id)sender {
    
   
    [self ZeroValue];
    
    CharadesViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    
    [self.navigationController pushViewController:HomeView animated:YES];
    [self presentViewController:HomeView animated:YES completion:nil];
    
   
    
}

-(void)ZeroValue{
    //Set Values for the scores to 0
    // Get Values from Store
    Store *ScoreVaulue =[Store sharedStore];
    ScoreVaulue.TeamA = @"";
    ScoreVaulue.TeamB =@"";
    ScoreVaulue.TeamAScore = 0;
    ScoreVaulue.TeamBScore = 0;
}
@end
