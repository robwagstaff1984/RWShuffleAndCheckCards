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

#define STANDARD_NUM_SUITS 4
#define STANDARD_NUM_CARDS_IN_A_SUIT 13

@implementation RWCardDeck


- (id)initWithStandardDeck
{
    self = [super init];
    if (self) {
        self.cards = [NSMutableArray arrayWithArray:[self standardDeck]];
//        self.cards = [NSMutableArray arrayWithArray:[self twoCardDeck]];
    }
    return self;
}

-(NSArray*) twoCardDeck {
    return @[[[RWCard alloc] initWithCardValue:6 suit:2], [[RWCard alloc] initWithCardValue:7 suit:2]];
             
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

//Hashing not working. nil values may be a problem
-(NSMapTable*) twoCardSequences {
    NSMapTable* twoCardSequenceCombinations = [[NSMapTable alloc] init];
    
    for (int counter = 0; counter < [self.cards count] - 1; counter++) {
        RWCard* currentCard = self.cards[counter];
        RWCard* nextCard = self.cards[counter+1];
        
        if ((currentCard.cardValue == nextCard.cardValue + 1) || (currentCard.cardValue == nextCard.cardValue - 1)) {
            
            RWCardCombination* cardCombination = [[RWCardCombination alloc] initWithCardsInCombination:@[currentCard, nextCard]];
            
            long hashKey = [cardCombination hash];
            [twoCardSequenceCombinations setObject:cardCombination forKey:@(hashKey)];
        }
    }
    return twoCardSequenceCombinations;
}

@end
