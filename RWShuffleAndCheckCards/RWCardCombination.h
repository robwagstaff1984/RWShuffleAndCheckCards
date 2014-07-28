//
//  RWCardCombination.h
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWCardCombination : NSObject

@property (nonatomic, strong) NSArray* cardsInCombination;

- (id)initWithCardsInCombination:(NSArray*)cardsInCombination;

-(void) printCardCombination;

@end
