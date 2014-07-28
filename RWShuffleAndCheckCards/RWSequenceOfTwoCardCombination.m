//
//  RWRunOfTwoCardCombination.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/27/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWSequenceOfTwoCardCombination.h"
#import "RWCard.h"

@implementation RWSequenceOfTwoCardCombination

+(RWSequenceOfTwoCardCombination*) cardCombinationForCards:(NSArray*) cards atPosition:(int)position {
    
    RWSequenceOfTwoCardCombination* cardCombination = [[RWSequenceOfTwoCardCombination alloc] initWithCardsInCombination:@[cards[position], cards[position++]]];
    return cardCombination;
}

+ (BOOL)isCardCombinationForCards:(NSArray*)cards atPostion:(int) position {
    if (position + 1 >= [cards count]) {
        return NO;
    }
    
    RWCard* currentCard = cards[position];
    RWCard* nextCard = cards[position+1];
    return (currentCard.cardValue == nextCard.cardValue + 1) || (currentCard.cardValue == nextCard.cardValue - 1);
}

@end
