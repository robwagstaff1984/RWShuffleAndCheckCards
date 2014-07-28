//
//  ViewController.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "ViewController.h"
#import "RWCardDeck.h"
#import "RWGameLogic.h"


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


/*
 Question Answers:
 1) I would use a generic CardCombination class and have each specific card sequence subclass this. Each subclass would have it's own logic to determine what is a valid card combination and how to create the card combination. I have implemented this solution.
 
 2) I would use the same generic cardCombination descrived in question 1 but have the subclass check for N combinations of cards instead. I would loop through each card in the deck and see if the card matches the first card required in the combination. I would then loop through all of the other required cards for the combination and test if they appear sequentially after the examined card.
 3) Instead of storing two NSMapTables for both the previous and current shuffles, I would store one NSMapTable for all of the cardCombinations found so far. This would actually simplify it and speed it up to O(1) lookup time instead of O(N) lookup time for previous card Combinations.
 4) I would modify and subclass RWCardDeck so that instead of creating 4 * 13 cards, it creates X * Y cards with the appropriate card values and suits set.
 5)
 */

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    RWCardDeck* standardCardDeck = [[RWCardDeck alloc] initWithStandardDeck];
    RWGameLogic* gameLogic = [[RWGameLogic alloc] initWithCardDeck:standardCardDeck];
    
    [gameLogic startGame];
}



@end
