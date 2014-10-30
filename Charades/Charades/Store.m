//
//  Store.m
//  MyTravelTip
//
//  Created by Nicholas Barrowclough on 30/05/2012.
//  Copyright (c) 2012 AKCP. All rights reserved.
//

#import "Store.h"

@implementation Store
@synthesize TeamA,TeamB,Team, TeamBScore,TeamAScore;

static Store *sharedStore = nil;

// Store* myStore = [Store sharedStore];
+ (Store *) sharedStore {
    @synchronized(self){
        if (sharedStore == nil){
            sharedStore = [[self alloc] init];
        }
    }
    
    return sharedStore;
}


@end
