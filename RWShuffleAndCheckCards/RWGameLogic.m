//
//  RWGameLogic.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/27/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWGameLogic.h"
#import "RWCardCombination.h"

@interface RWGameLogic()

@property(nonatomic, strong) RWCardDeck* cardDeck;
@property(nonatomic, assign) int shuffleCount;
@property(nonatomic, strong) NSMapTable* firstRunOfTwoCombinations;
@property(nonatomic, strong) NSMapTable* secondRunOfTwoCombinations;

@end

@implementation RWGameLogic

- (id)initWithCardDeck:(RWCardDeck*)cardDeck
{
    self = [super init];
    if (self) {
        self.cardDeck = cardDeck;
    }
    return self;
}

-(void) startGame {

    BOOL previousSequenceFound = YES;
    [self setupGame];
    
    while (previousSequenceFound) {
        [self shuffleAndPrintDeck];
        self.secondRunOfTwoCombinations = [self.cardDeck twoCardSequences];
        previousSequenceFound = [self isACardCombinationInCurrentAndPreviousShuffle];
        
    }
    NSLog(@"You win!\n%d shuffles taken to win", self.shuffleCount);
}

-(BOOL) isACardCombinationInCurrentAndPreviousShuffle {
    
    for (RWCardCombination* runOfTwoCombination in [[self.secondRunOfTwoCombinations objectEnumerator] allObjects]) {
        
        RWCardCombination *previousRunOfTwoCombo = [self.firstRunOfTwoCombinations objectForKey:@([runOfTwoCombination hash])];
        if(previousRunOfTwoCombo && [runOfTwoCombination isEqual:previousRunOfTwoCombo]) {
            NSLog(@"\n\nDuplicate Sequence Found start again!\n\n");
            [runOfTwoCombination printCardCombination];
            return YES;
        }
    }
    return NO;
}

-(void) setupGame {
    self.shuffleCount = 0;
    NSLog(@"\n\nCards in order:\n");
    [self.cardDeck printDeck];
    [self shuffleAndPrintDeck];
    self.firstRunOfTwoCombinations = [self.cardDeck twoCardSequences];
}

-(void) shuffleAndPrintDeck {
    self.shuffleCount++;
    NSLog(@"\n\nCards shuffled %d times:\n\n", self.shuffleCount);
    [self.cardDeck shuffleDeck];
    [self.cardDeck printDeck];
}

@end
