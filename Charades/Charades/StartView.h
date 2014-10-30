//
//  StartView.h
//  Charades
//
//  Created by Rene Candelier on 1/17/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryViewController.h"
#import "CharadesActionView.h"
#import "SampleSheetViewController.h"
@interface StartView : UIViewController{
    //Item to that will be acted out
    NSArray *categoryItem;
    //Counter for the item in the array
    NSInteger *arrayCounter;

}

//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIView *tourView;
- (IBAction)hideTourView:(id)sender;

//Array for the categories
@property(nonatomic,retain) NSMutableArray *randomCategories;
@property(nonatomic,retain) NSMutableArray *singersCategory;
@property(nonatomic,retain) NSMutableArray *movieCategory;
@property(nonatomic,retain) NSArray *showsCategory;
@property(nonatomic,retain) NSMutableArray *celebsCategory;
//Array of the Categories
@property(nonatomic,retain) NSMutableArray *categories;
//new Array with Random order of a Categorie Selected
@property(nonatomic,retain) NSMutableArray *resultArray;

//Category name to be sent to the next view
@property(nonatomic,strong) NSString *category;
//Team String for Points
@property(nonatomic,strong) NSString *teamsTurn;

//Button for next item in array
- (IBAction)nextButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)previousButton:(id)sender;
- (IBAction)nextCategory:(id)sender;
- (IBAction)backCategory:(id)sender;

//Label used to display item in category
@property (weak, nonatomic) IBOutlet UILabel *CategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentCategory;
//Tap effect
- (IBAction)itemSwipTouchEffect:(UITapGestureRecognizer *)recognizer;
- (IBAction)itemCategoryTouchEffect:(UITapGestureRecognizer *)recognizer;

//Swipe Effect

- (IBAction)itemSwip:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)itemSwipRight:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)categorySwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)categorySwipeRight:(UISwipeGestureRecognizer *)sender;

//Boolean variable for Team A & B
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;

- (IBAction)startButton:(id)sender;

//Page Control for the Categories
@property (weak, nonatomic) IBOutlet UIPageControl *radioCounter;
- (IBAction)scoreButton:(id)sender;
//Pop Up that shows the scores
@property (weak, nonatomic) SampleSheetViewController *PopUpForScore;


- (int)stringLength;
@end
