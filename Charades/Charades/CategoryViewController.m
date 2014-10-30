//
//  CategoryViewController.m
//  Charades
//
//  Created by Rene Candelier on 1/8/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "CategoryViewController.h"


@interface CategoryViewController ()

@end

@implementation CategoryViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Movies:(id)sender {
    //Gets the title of the button
    UIButton *resultButton = (UIButton *)sender;
    categoryOption = resultButton.currentTitle;
    //Opens the View Controller
    [self performSegueWithIdentifier:@"Categories" sender:self];
}

- (IBAction)backButton:(id)sender {
    
    //Button that goes to the home view
    [self dismissViewControllerAnimated:TRUE completion:nil];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Categories"])
    {
        //Sends category to view
        StartView *categoryController = segue.destinationViewController;
        categoryController.category = categoryOption;
        
    }
}
@end
