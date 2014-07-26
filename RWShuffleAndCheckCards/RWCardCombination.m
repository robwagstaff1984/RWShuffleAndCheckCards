//
//  RWCardCombination.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWCardCombination.h"
#import "RWCard.h"

@implementation RWCardCombination

- (id)initWithCardsInCombination:(NSArray*)cardsInCombination
{
    self = [super init];
    if (self) {
        self.cardsInCombination = [[NSMutableArray alloc] initWithArray:cardsInCombination];
    }
    return self;
}


- (BOOL)isEqualToCardCombination:(RWCardCombination *)cardCombination {
    if (!cardCombination) {
        return NO;
    }
    
    for (int counter =0; counter < [self.cardsInCombination count]; counter++) {
        RWCard* thisCardCombinationCard = self.cardsInCombination[counter];
        RWCard* otherCardCombinationCard = cardCombination.cardsInCombination[counter];
        
        if(thisCardCombinationCard.cardValue != otherCardCombinationCard.cardValue &&
           thisCardCombinationCard.suit != otherCardCombinationCard.suit) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[RWCardCombination class]]) {
        return NO;
    }
    
    return [self isEqualToCardCombination:(RWCardCombination *)object];
}

- (NSUInteger)hash {
    NSString* combinedCardIdentifier = [NSString stringWithFormat:@"%u|%u",[self.cardsInCombination[0] cardIdentifier], [self.cardsInCombination[1] cardIdentifier]];
    return [combinedCardIdentifier hash];
}




@end
