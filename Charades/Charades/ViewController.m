//
//  ViewController.m
//  Charades
//
//  Created by Rene Candelier on 2/5/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import "ViewController.h"
#import "PageSubclass.h"
#import "SMPageControl.h"
#import <QuartzCore/QuartzCore.h>
#import "CharadesViewController.h"

static NSString * const sampleDesc1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDesc2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDesc3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDesc4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@interface ViewController (){
    UIView *rootView;
}


@end

@implementation ViewController

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
    rootView = self.navigationController.view;
[self showIntroWithCrossDissolve];
}
- (void)introDidFinish:(EAIntroView *)introView {
    NSLog(@"introDidFinish callback");
    //[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDesc1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleImage = [UIImage imageNamed:@"title1"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDesc2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleImage = [UIImage imageNamed:@"title2"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDesc3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleImage = [UIImage imageNamed:@"title3"];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDesc3;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleImage = [UIImage imageNamed:@"title4"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [intro showInView:rootView animateDuration:0.3];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
