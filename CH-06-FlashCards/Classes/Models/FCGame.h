//
//  FCGame.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FCCard.h"
#import "FCAnswerKey.h"

#import <CoreData/CoreData.h>

@interface FCGame : NSObject 

@property (nonatomic, strong) NSMutableArray* cards; 
@property (nonatomic) int currentCard;
@property (nonatomic, strong) NSDate *gameStart;

-(id) initWithCards:(NSMutableArray*)c;
-(bool) hasMoreCards;
-(FCCard*) getNextCard;
-(int) getNumRight;
-(int) getNumWrong;

-(NSError*)save:(NSManagedObjectContext *)context;

@end
