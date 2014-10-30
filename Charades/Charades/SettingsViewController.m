//
//  SettingsViewController.m
//  Charades
//
//  Created by Rene Candelier on 2/5/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "SettingsViewController.h"
#import "Store.h"
#import "CharadesViewController.h"
@interface SettingsViewController ()

@end



@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



//Method to hide keyboard
-(void)tap:(UIGestureRecognizer* )gr{
    [self.view endEditing:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.maxScore.delegate = self;
    
    
    
    
    
	// Recognizer to hide keyboard when touching the background
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [self.view addGestureRecognizer:tapRecognizer];
    
    //Load the Minute settings that was previously saved
    NSUserDefaults *prefsForMinutes = [NSUserDefaults standardUserDefaults];
    NSInteger myInt = [prefsForMinutes integerForKey:@"integerKey"];
    
   
    
    self.minutesToPlay.selectedSegmentIndex =myInt;
    //Settings for maximum score
    NSUserDefaults *prefsForMaxScore = [NSUserDefaults standardUserDefaults];
    NSInteger intForScoreTextField = [prefsForMaxScore integerForKey:@"Score"];
    //convert the integer to string
    NSString *scoreInt = [NSString stringWithFormat:@"%ld",(long)intForScoreTextField];
    if (scoreInt == 0) {
        self.maxScore.text = @"";
    }else{
     self.maxScore.text=scoreInt;   
    }
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.maxScore.inputAccessoryView = numberToolbar;
    
}

-(void)cancelNumberPad{
    self.maxScore.text =@"";
    [self.maxScore resignFirstResponder];
}

-(void)doneWithNumberPad{
   int number = [[self.maxScore text] intValue];
    NSUserDefaults *prefsForScore = [NSUserDefaults standardUserDefaults];
    if (number<=0) {
        self.maxScore.text =@"";
        [prefsForScore setInteger:5 forKey:@"Score"];
    }else{
        [prefsForScore setInteger:number forKey:@"Score"];
    }
    [self.maxScore resignFirstResponder];
    
    
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)feedbackButton:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Feedback - act-it-out";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"info@NovusMobile.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)home:(id)sender {
    
    int number = [[self.maxScore text] intValue];
    NSUserDefaults *prefsForScore = [NSUserDefaults standardUserDefaults];
    if (number<=0) {
        self.maxScore.text =@"";
        [prefsForScore setInteger:5 forKey:@"Score"];
    }else{
        [prefsForScore setInteger:number forKey:@"Score"];
    }
    [self.maxScore resignFirstResponder];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self goBackHome];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    if ([UIMenuController sharedMenuController]) {
        
        [UIMenuController sharedMenuController].menuVisible = NO;
        
    }
    
    return NO;
}

-(void)goBackHome{
    CharadesViewController *HomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    
    [self.navigationController pushViewController:HomeView animated:YES];
    [self presentViewController:HomeView animated:YES completion:nil];
}


- (IBAction)minutesToPlay:(id)sender {
    
    NSUserDefaults *prefsForMinutes = [NSUserDefaults standardUserDefaults];
    
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
            //1 minute
            [prefsForMinutes setInteger:0 forKey:@"integerKey"];
            
            break;
        case 1:
            //2 minutes
            
           [ prefsForMinutes setInteger:1 forKey:@"integerKey"];
            break;
        default:
            //1 minute
           [prefsForMinutes setInteger:0 forKey:@"integerKey"];
            break;
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
}
@end
