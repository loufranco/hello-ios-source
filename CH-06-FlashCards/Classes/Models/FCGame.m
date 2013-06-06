//
//  FCGame.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "FCGame.h"
#import "GameResult.h"
#import "CardResult.h"



@implementation FCGame

@synthesize cards = _cards;
@synthesize currentCard = _currentCard;
@synthesize gameStart= _gameStart;

-(id)initWithCards:(NSMutableArray*)c
{
    if (self = [super init]) {
        self.cards = c;
        self.currentCard = 0;
        self.gameStart = [NSDate date];
    }
    return self;
}


-(bool) hasMoreCards
{
    return self.currentCard < [self.cards count];
}

-(FCCard*) getNextCard
{
    FCCard* card = [self.cards objectAtIndex:self.currentCard];
    self.currentCard++;
    return card;
}


-(int) getNumRight
{
    int numRight = 0;
    for (int i = 0; i < [self.cards count]; ++i) { 
        FCCard* c = [self.cards objectAtIndex:i];
        if (c.isCorrect) {
            numRight++;
        }
    }
    return numRight;
}

-(int) getNumWrong
{
    return [self.cards count] - [self getNumRight];
}

-(NSError*)save:(NSManagedObjectContext *)context
{
    GameResult *gameResult; 
    gameResult = [NSEntityDescription 
                  insertNewObjectForEntityForName:@"GameResult" 
                  inManagedObjectContext:context];
    
    gameResult.gameDate = self.gameStart;
    gameResult.gameLength = [NSNumber numberWithInteger: 
                             -[self.gameStart timeIntervalSinceNow]];
    
    for (FCCard* c in self.cards) {
        [gameResult addCardResultsObject:
         [c cardResultInGame:gameResult withContext:context]];
    }
    
    NSError *error;
    if ([context save:&error]) {
        return nil;
    } 
    return error;
}

@end
