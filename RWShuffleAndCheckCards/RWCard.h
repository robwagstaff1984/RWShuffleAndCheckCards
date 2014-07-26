//
//  RWCard.h
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RWCard : NSObject

- (id)initWithCardValue:(int)cardValue suit:(int)suit;

@property (nonatomic, assign) int suit;
@property (nonatomic, assign) int cardValue;

@end
