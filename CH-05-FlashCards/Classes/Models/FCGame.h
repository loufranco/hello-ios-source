//
//  FCGame.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <Foundation/Foundation.h>
#import "FCCard.h"
#import "FCAnswerKey.h"

@interface FCGame : NSObject 

@property (nonatomic, strong) NSMutableArray* cards; 
@property (nonatomic) int currentCard;

-(id) initWithCards:(NSMutableArray*)c;
-(bool) hasMoreCards;
-(FCCard*) getNextCard;
-(int) getNumRight;
-(int) getNumWrong;

@end
