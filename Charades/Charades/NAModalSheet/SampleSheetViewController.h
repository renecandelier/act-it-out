//
//  SampleSheetViewController.h
//  NAModalSheet
//
//  Created by Ken Worley on 11/22/13.
//  Copyright (c) 2013 Ken Worley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NAModalSheet;

@interface SampleSheetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *teamBscoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *teamAscoreLabel;
@property (nonatomic, weak) NAModalSheet *modalSheet;
@property (retain, nonatomic) NSString *teamAScore;
@property (nonatomic, weak) NSString *teamBScore;
@end
