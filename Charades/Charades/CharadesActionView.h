//
//  CharadesActionView.h
//  Charades
//
//  Created by Rene Candelier on 1/8/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryViewController.h"
@interface CharadesActionView : UIViewController
{
 // label of clock
    IBOutlet UILabel *clockLabel;
    //this is date object for getting today date.
    NSDate *databaseDate;
    
    //timer object this actually used to call update label value after every seconds
    NSTimer *timer; //from this we are taking minutes from user
UITextField *txtTimeInMinute;
    NSInteger Minutes;
    NSInteger Score;

}

//Score keeper for Team A & Team B

//Label that displays Item to be acted out
@property (weak, nonatomic) IBOutlet UILabel *CategoryLabel;

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
//Timer Label
@property(nonatomic, retain) IBOutlet UILabel *clockLabel;
@property(nonatomic, retain) NSDate *databaseDate;

//Category name to be sent to the next view
@property(nonatomic,strong) NSString *currentCategory;
//Item that will need to be acted out.
@property(nonatomic,strong) NSString *currentItem;
//String for team
@property(nonatomic,strong) NSString *whatTeamisUp;

//This is the Quit Button
- (IBAction)homeButton:(id)sender;
//Got it Button
- (IBAction)gotIt:(id)sender;

//Time
@property (nonatomic, assign) NSInteger Minutes;
@property (nonatomic, assign) NSInteger Score;
@end
