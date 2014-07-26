//
//  RWCard.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWCard.h"

@implementation RWCard

- (id)initWithCardValue:(int)cardValue suit:(int)suit
{
    self = [super init];
    if (self) {
        self.cardValue = cardValue;
        self.suit = suit;
        [self hash];
    }
    return self;
}


@end
