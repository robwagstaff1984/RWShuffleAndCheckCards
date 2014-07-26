//
//  ViewController.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "ViewController.h"
#import "RWCardDeck.h"
#import "RWCardCombination.h"

//1) create a deck of cards, and print/display the cards
//2) shuffle the deck of cards, and display the cards (in their shuffled order)
//3) reshuffle the deck, and display the cards (in their shuffled order)
//4) look for any 2-card sequence that was also present in the previous shuffle. If any are found, go back to step 3
//5) when two back to back shuffles do not contain a duplicate sequence, you're done.
//
//Questions:
//1) How might you adapt your code to check for sequences of 3, 4, or more cards from the previous shuffle?
//2) How might you adapt your code to check for combinations of N cards, rather than sequences?
//3) How might you adapt your code to check for card sequences that were present in any previous shuffle? (i.e. comparing against all previous shuffles, not just the most recent one)
//4) If necessary, how might you change your code to accommodate more than 4 suits, or more than 13 different card values.
//5) Would you do things any differently if you were optimizing purely for speed? How about if you were trying to minimize memory usage?


@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    RWCardDeck* cardDeck = [[RWCardDeck alloc] initWithStandardDeck];
    BOOL previousSequenceFound = YES;
    
    while (previousSequenceFound) {
    previousSequenceFound = NO;
//    NSLog(@"\n\nCards in order:\n");
//    [cardDeck printDeck];
    NSLog(@"\n\nCards shuffled once:\n\n");
    [cardDeck shuffleDeck];
    [cardDeck printDeck];
    NSMapTable* firstRunOfTwoCombination = [cardDeck twoCardSequences];
    
    NSLog(@"\n\nCards shuffled twice:\n\n");
    [cardDeck shuffleDeck];
    [cardDeck printDeck];

    NSMapTable* secondRunOfTwoCombination = [cardDeck twoCardSequences];
    
    
    for (RWCardCombination* runOfTwoCombination in [[secondRunOfTwoCombination objectEnumerator] allObjects]) {

        RWCardCombination *previousRunOfTwoCombo = [firstRunOfTwoCombination objectForKey:@([runOfTwoCombination hash])];
        
        if(previousRunOfTwoCombo && [runOfTwoCombination isEqual:previousRunOfTwoCombo]) {
            previousSequenceFound = YES;
            NSLog(@"\n\nDuplicate Sequence Found start again!\n\n");
            break;
        }
    }
    
    }
    NSLog(@"you win");
}



@end
