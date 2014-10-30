//
//  SampleSheetViewController.m
//  NAModalSheet
//
//  Created by Ken Worley on 11/22/13.
//  Copyright (c) 2013 Ken Worley. All rights reserved.
//

#import "SampleSheetViewController.h"
#import "NAModalSheet.h"
#import "StartView.h"
@implementation SampleSheetViewController
@synthesize teamAScore;

- (instancetype)init
{
  self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
  if (self)
  {
      CGSize s = self.view.bounds.size;
      
      s.height = 100;
      s.width = 100;
      
      
      [self.modalSheet adjustContentSize:s animated:YES];
        }
  return self;
}

- (IBAction)dismissButtonTouched:(id)sender
{
  [self.modalSheet dismissWithCompletion:^{
    
  }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.teamAscoreLabel.text = self.teamAScore;

}

@end
