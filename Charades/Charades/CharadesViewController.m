//
//  CharadesViewController.m
//  Charades
//
//  Created by Rene Candelier on 1/6/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "CharadesViewController.h"

#import "PageSubclass.h"
#import "SMPageControl.h"
#import <QuartzCore/QuartzCore.h>



static NSString * const sampleDesc1 = @"Get ready to have a blast!";
static NSString * const sampleDesc2 = @"Over 2000+ items to act out!";
static NSString * const sampleDesc3 = @"Prove your acting skils.";
static NSString * const sampleDesc4 = @"Let's Play!";

@interface CharadesViewController (){
    UIView *rootView;
}

@end

@implementation CharadesViewController

- (void)viewDidLoad
{
    

    [super viewDidLoad];
	if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"Avalue"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"Avalue"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        rootView = self.navigationController.view;
        [self showIntroWithCrossDissolve];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Welcome to act it-out!";
    page1.desc = sampleDesc1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleImage = [UIImage imageNamed:@"act-services-icon"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"Pick fun items to act!";
    page2.desc = sampleDesc2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleImage = [UIImage imageNamed:@"Trophy-icon-copy-300x300"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"Challenge your friends!";
    page3.desc = sampleDesc3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleImage = [UIImage imageNamed:@"icon-community3"];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"Enough talking!";
    page4.desc = sampleDesc4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleImage = [UIImage imageNamed:@"film_reel"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [intro showInView:rootView animateDuration:0.3];
    
    
}


- (IBAction)rateButton:(id)sender {
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id836781461"]];
    
}
@end
