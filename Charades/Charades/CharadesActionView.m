//
//  CharadesActionView.m
//  Charades
//
//  Created by Rene Candelier on 1/8/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "CharadesActionView.h"
#import "StartView.h"
#import "CharadesViewController.h"
#import "TimesUpViewController.h"
#import "EndGameViewController.h"
#import "TeamInfo.h"
#import "CharadesAppDelegate.h"
#import "Store.h"

@interface CharadesActionView ()

@end

@implementation CharadesActionView

@synthesize clockLabel;
@synthesize databaseDate,Minutes;


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
    
    
    
    
	//Get settings for minutes
    NSUserDefaults *prefsForMinutes = [NSUserDefaults standardUserDefaults];
    NSInteger minutesToPlay = [prefsForMinutes integerForKey:@"integerKey"];
    
    //Condition for 1 or 2 minutes
    
    if (minutesToPlay ==1) {
        
        //Two Minutes
        self.Minutes = 120;
    } else{
        
        //One Minute
        self.Minutes = 60;
    }
    
    //Start the timer
    [self showClock];
    
//Item to be acted out is displayed
    self.CategoryLabel.text= self.currentItem;

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) showClock {
    
    NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];
    
    if (!timer || remainingSec <= 0) {
        [timer invalidate];
        timer = nil;
    // getting time from text field or passing value init here i am passing 120 as a heard code value and multiplying with 60 to convert into seconds
    //self.databaseDate = [NSDate dateWithTimeIntervalSinceNow:(120*60)];
    self.databaseDate = [NSDate dateWithTimeIntervalSinceNow:(self.Minutes)];
    remainingSec = [databaseDate timeIntervalSinceNow];
    //timer value calling timer continousley
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self                                                selector:@selector(showClock)                                                userInfo:nil                                                 repeats:YES];     }
    //here showing value in hours
    NSInteger hours = remainingSec / 3600;
    NSInteger remainder = ((NSInteger)remainingSec)% 3600;
    //here showing value in minute
    NSInteger minutes = remainder / 60;
    //here i am showing value in seconds
    NSInteger seconds = remainder % 60;
   //Get settings data for time
    NSUserDefaults *prefsForMinutes = [NSUserDefaults standardUserDefaults];
    NSInteger myInt = [prefsForMinutes integerForKey:@"integerKey"];
    if (myInt ==1) {
        //here showing value for text label
        clockLabel.text = [NSString stringWithFormat:@"%01d:%02d", minutes,seconds];
        if (minutes==0&&seconds==0) {
            CharadesViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"timesUp"];
            
            [self.navigationController pushViewController:HomeView animated:YES];
            [self presentViewController:HomeView animated:YES completion:nil];    }
    } else{
        //here showing value for text label
        clockLabel.text = [NSString stringWithFormat:@"%02d",seconds];
       
        //Condition when the 
        if (seconds==0) {
            CharadesViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"timesUp"];
            
            [self.navigationController pushViewController:HomeView animated:YES];
            [self presentViewController:HomeView animated:YES completion:nil];
            
        }
    }
    
    [self timeEffect];

    
    
}

-(void) timeEffect{
    NSString *newText;
    UILabel  *existingLabel = self.clockLabel;
    
    
    newText = self.clockLabel.text;
    
    // animate the sliding of them into place
    
    [UIView transitionWithView:existingLabel
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        existingLabel.text = newText;
                    }
                    completion:nil];
    
    
}

- (IBAction)homeButton:(id)sender {
    CharadesViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    
    [self.navigationController pushViewController:HomeView animated:YES];
    [self presentViewController:HomeView animated:YES completion:nil];

}

- (IBAction)gotIt:(id)sender {
    
    //Get settings data for time
    NSUserDefaults *prefsForScore = [NSUserDefaults standardUserDefaults];
    NSInteger maxScore = [prefsForScore integerForKey:@"Score"];
    
    Store* myStore = [Store sharedStore];
    
    if ([self.whatTeamisUp isEqualToString:@"Team A"]) {
        myStore.TeamAScore+=1;
        
    }else if ([self.whatTeamisUp isEqualToString:@"Team B"]) {
        myStore.TeamBScore+=1;
     
    }
    if ((myStore.TeamBScore-myStore.TeamAScore==2)&(myStore.TeamBScore>=maxScore)) {
        NSLog(@"Team B Wins!");
     
        EndGameViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"endOfGame"];
        
        [self.navigationController pushViewController:HomeView animated:YES];
        [self presentViewController:HomeView animated:YES completion:nil];
    }else if((myStore.TeamAScore-myStore.TeamBScore==2)&(myStore.TeamAScore>=maxScore)) {
      
        //Display the team that Wins
        EndGameViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"endOfGame"];
     
        [self.navigationController pushViewController:HomeView animated:YES];
        [self presentViewController:HomeView animated:YES completion:nil];
    }
    
   //Convert the Team A integer to String
    NSString *scoreA = [NSString stringWithFormat:@"%d",myStore.TeamAScore];
    //Convert the Team B integer to String
    NSString *scoreB = [NSString stringWithFormat:@"%d",myStore.TeamBScore];
    
    
    //set the Team A score in the App delegate
      
    //NSLog(@"%@",myStore.TeamAScore);
    myStore.TeamA =scoreA;
    myStore.TeamB = scoreB;
    
    
      }



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"StartPlay"])
    {
        //Send the item of the category and counter to the
        StartView *categoryController = segue.destinationViewController;
        //Sends the current category so that it can initiate from the last choosen category rather than Random
         categoryController.category=self.currentCategory;
        
    }
}
@end
