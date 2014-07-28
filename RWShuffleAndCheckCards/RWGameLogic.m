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
@property(nonatomic, strong) NSMapTable* firstShuffleCombinations;
@property(nonatomic, strong) NSMapTable* secondShuffleCombinations;
@property(nonatomic, assign) CardCombinationType cardCombinationType;

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

    NSLog(@"Playing 2 card sequence game:\n");
    [self setupGameWithCardCombinationType:CardCombinationTypeSequenceOfTwo];
    [self playGame];
    
    
    NSLog(@"\nImplementing Question 1:\nPlaying 3 card sequence game:\n");
    [self setupGameWithCardCombinationType:CardCombinationTypeSequenceOfThree];
    [self playGame];
}

-(void) playGame {
    
    [self shuffleAndPrintDeck];
    self.secondShuffleCombinations = [self.cardDeck cardCombinationsForType:self.cardCombinationType];
    
    if ([self isACardCombinationInCurrentAndPreviousShuffle]) {
        self.firstShuffleCombinations = self.secondShuffleCombinations;
        [self playGame];
    } else {
        NSLog(@"You win!\n%d shuffles taken to win\n", self.shuffleCount);
    }
}


-(BOOL) isACardCombinationInCurrentAndPreviousShuffle {
    
    for (RWCardCombination* runOfTwoCombination in [[self.secondShuffleCombinations objectEnumerator] allObjects]) {
        
        RWCardCombination *previousRunOfTwoCombo = [self.firstShuffleCombinations objectForKey:@([runOfTwoCombination hash])];
        if(previousRunOfTwoCombo && [runOfTwoCombination isEqual:previousRunOfTwoCombo]) {
            NSLog(@"\n\nDuplicate Sequence Found start again!\n\n");
            [runOfTwoCombination printCardCombination];
            return YES;
        }
    }
    return NO;
}

-(void) setupGameWithCardCombinationType:(CardCombinationType) cardCombinationType {
    self.shuffleCount = 0;
    self.cardCombinationType = cardCombinationType;
    NSLog(@"\n\nCards in order:\n");
    [self.cardDeck printDeck];
    [self shuffleAndPrintDeck];
    self.firstShuffleCombinations = [self.cardDeck cardCombinationsForType:self.cardCombinationType];
}

-(void) shuffleAndPrintDeck {
    self.shuffleCount++;
    NSLog(@"\n\nCards shuffled %d times:\n\n", self.shuffleCount);
    [self.cardDeck shuffleDeck];
    [self.cardDeck printDeck];
}

@end
