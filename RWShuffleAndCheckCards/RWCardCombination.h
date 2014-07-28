//
//  RWCardCombination.h
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWCardCombination : NSObject

typedef enum {
    CardCombinationTypeSequenceOfTwo = 1,
    CardCombinationTypeSequenceOfThree = 2,
    CardCombinationTypeArbitraryCombination = 3,
} CardCombinationType;

@property (nonatomic, strong) NSArray* cardsInCombination;

- (id)initWithCardsInCombination:(NSArray*)cardsInCombination;
-(void) printCardCombination;

+(NSMapTable*) cardCombinationsForCards:(NSArray*)cards;

+(RWCardCombination*) cardCombinationForCards:(NSArray*) cards atPosition:(int)position;
+(BOOL)isCardCombinationForCards:(NSArray*)cards atPostion:(int) position;

@end
