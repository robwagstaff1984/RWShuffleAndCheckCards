//
//  RWSequenceOfThreeCardCombination.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/27/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWSequenceOfThreeCardCombination.h"
#import "RWCard.h"

@implementation RWSequenceOfThreeCardCombination

+(RWSequenceOfThreeCardCombination*) cardCombinationForCards:(NSArray*) cards atPosition:(int)position {
    
    RWSequenceOfThreeCardCombination* cardCombination = [[RWSequenceOfThreeCardCombination alloc] initWithCardsInCombination:@[cards[position], cards[position++], cards[position+2]]];
    return cardCombination;
}

+ (BOOL)isCardCombinationForCards:(NSArray*)cards atPostion:(int)position {
    if (position + 2 >= [cards count]) {
        return NO;
    }
    
    RWCard* currentCard = cards[position];
    RWCard* nextCard = cards[position+1];
    RWCard* thirdCard = cards[position+2];
    
    return ((currentCard.cardValue == nextCard.cardValue + 1) || (currentCard.cardValue == nextCard.cardValue - 1)) &&
    ((nextCard.cardValue == thirdCard.cardValue + 1) || (nextCard.cardValue == thirdCard.cardValue - 1));
}

@end
