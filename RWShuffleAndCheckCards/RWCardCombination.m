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

-(void) printCardCombination {

    printf("Card combination:\n");
    for (RWCard* card in self.cardsInCombination) {
        [card printCard];
    }
    printf("\n");
}

+(NSMapTable*) cardCombinationsForCards:(NSArray*)cards {
    
    NSMapTable* cardCombinations = [[NSMapTable alloc] init];
    
    for (int counter = 0; counter < [cards count]; counter++) {
        if ([self isCardCombinationForCards:cards atPostion:counter]) {
            RWCardCombination* cardCombination = [self cardCombinationForCards:cards atPosition:counter];
            [cardCombinations setObject:cardCombination forKey:@([cardCombination hash])];
        }
    }
    return cardCombinations;
}

+(RWCardCombination*) cardCombinationForCards:(NSArray*) cards atPosition:(int)position {
    NSAssert(NO, @"Should subclass cardCombination");
    return nil;
}

+ (BOOL)isCardCombinationForCards:(NSArray*)cards atPostion:(int) position {
    NSAssert(NO, @"Should subclass cardCombination");
    return NO;
}

@end
