//
//  RWCardDeck.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWCardDeck.h"
#import "RWCard.h"
#import "RWCardCombination.h"
#import "RWSequenceOfTwoCardCombination.h"
#import "RWSequenceOfThreeCardCombination.h"
#import "RWArbitraryCardCombination.h"

#define STANDARD_NUM_SUITS 4
#define STANDARD_NUM_CARDS_IN_A_SUIT 13

@implementation RWCardDeck


- (id)initWithStandardDeck
{
    self = [super init];
    if (self) {
        self.cards = [NSMutableArray arrayWithArray:[self standardDeck]];
    }
    return self;
}

-(NSArray*) standardDeck {
    NSMutableArray* standardDeck = [[NSMutableArray alloc] init];
    for (int counter=0; counter < STANDARD_NUM_SUITS * STANDARD_NUM_CARDS_IN_A_SUIT; counter++) {
        RWCard* card = [[RWCard alloc] initWithCardValue:(counter % 13) suit:(counter / 13)];
        standardDeck[counter] = card;
    }
    return standardDeck;
}

-(void) shuffleDeck {
    for (NSInteger i = [self.cards count] - 1; i > 0; --i) {
        [self.cards exchangeObjectAtIndex: arc4random() % (i+1) withObjectAtIndex: i];
    }
}

-(void) printDeck {
    NSLog(@"Current deck:");
    for (int counter = 0; counter < [self.cards count]; counter++) {
        [self.cards[counter] printCard];
    }
}

-(NSMapTable*) cardCombinationsForType:(CardCombinationType)cardCombinationType {
    
    if (cardCombinationType == CardCombinationTypeSequenceOfTwo) {
        return [RWSequenceOfTwoCardCombination cardCombinationsForCards:self.cards];
    } else if (cardCombinationType == CardCombinationTypeSequenceOfThree) {
        return [RWSequenceOfThreeCardCombination cardCombinationsForCards:self.cards];
    } else if (cardCombinationType == CardCombinationTypeArbitraryCombination) {
        return [RWArbitraryCardCombination cardCombinationsForCards:self.cards];
    }
    
    return nil;
}

@end
