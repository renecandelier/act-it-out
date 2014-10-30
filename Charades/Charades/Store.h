//
//  Store.h
//  MyTravelTip
//
//  Created by Nicholas Barrowclough on 30/05/2012.
//  Copyright (c) 2012 AKCP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject {
  
    NSString *TeamA;
    NSString *TeamB;
     NSString *Team;
    int TeamAScore;
    int TeamBScore;

}

@property (nonatomic, strong) NSString* Team;

//Team Turn
@property (nonatomic, strong) NSString* TeamA;
@property (nonatomic, strong) NSString* TeamB;

//Team Score
@property (nonatomic) int TeamAScore;
@property (nonatomic) int TeamBScore;

+ (Store *) sharedStore;

@end
