//
//  RWGameLogic.h
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/27/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWCardDeck.h"

@interface RWGameLogic : NSObject

- (id)initWithCardDeck:(RWCardDeck*)cardDeck;
-(void)startGame;

@end
