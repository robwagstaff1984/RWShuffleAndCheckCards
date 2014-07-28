//
//  RWCardDeck.h
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWCardCombination.h"

@interface RWCardDeck : NSObject

@property (nonatomic, strong) NSMutableArray* cards;

-(id)initWithStandardDeck;
-(void)shuffleDeck;
-(void)printDeck;
-(NSMapTable*) cardCombinationsForType:(CardCombinationType)cardCombinationType;
@end
