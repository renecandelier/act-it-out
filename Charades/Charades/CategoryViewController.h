//
//  CategoryViewController.h
//  Charades
//
//  Created by Rene Candelier on 1/8/14.
//  Copyright (c) 2014 NovusMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharadesActionView.h"
#import "StartView.h"
@interface CategoryViewController : UIViewController{
    NSString *categoryOption;
}
//Buttons even thought its named Movies
- (IBAction)Movies:(id)sender;
//Back Button
- (IBAction)backButton:(id)sender;


//Sends the category to the next view
@property(nonatomic, retain) NSString * categoryOption;
@end
