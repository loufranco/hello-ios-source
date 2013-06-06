//
//  FCCard.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import "FCCard.h"


@implementation FCCard



-(id) initWithQuestion:(NSString*)question 
                answer:(NSString*)answer 
          wrongAnswer1:(NSString*)wrongAnswer1 
          wrongAnswer2:(NSString*)wrongAnswer2
{
    if (self = [super init]) {
        self.cardText = question;
        
        self.answers = [[NSMutableArray alloc]   
                                         init];
		
        [self.answers addObject:answer];              
        [self.answers addObject:wrongAnswer1];
        [self.answers addObject:wrongAnswer2];
        
        int randomAnswerSlot = arc4random() % 3;      
        [self.answers exchangeObjectAtIndex:0 
                          withObjectAtIndex:randomAnswerSlot];
        self.correctAnswer = randomAnswerSlot;        
    }
    return self;
}



-(void) recordAnswer:(int)answerNum
{
    self.isCorrect = (answerNum == self.correctAnswer);
}






@end
