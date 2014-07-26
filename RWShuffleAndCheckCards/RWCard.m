//
//  RWCard.m
//  RWShuffleAndCheckCards
//
//  Created by Robert Wagstaff on 7/25/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWCard.h"

@implementation RWCard

- (id)initWithCardValue:(NSUInteger)cardValue suit:(NSUInteger)suit
{
    self = [super init];
    if (self) {
        self.cardValue = cardValue;
        self.suit = suit;
    }
    return self;
}

- (BOOL)isEqualToCard:(RWCard*)otherCard {
    if (!otherCard) {
        return NO;
    }
    
    if((self.cardValue != otherCard.cardValue) && (self.suit != otherCard.suit)) {
        return NO;
    }
    return YES;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[RWCard class]]) {
        return NO;
    }
    
    return [self isEqualToCard:(RWCard *)object];
}


-(NSUInteger) cardIdentifier {
    return (self.cardValue * self.suit) + self.cardValue;
}
@end
