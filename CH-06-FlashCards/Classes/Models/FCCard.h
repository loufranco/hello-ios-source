//
//  FCCard.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CardResult.h"

@interface FCCard : NSObject 

@property(nonatomic) bool isCorrect;                 
@property(nonatomic, strong) NSString* cardText;     
@property(nonatomic, strong) NSMutableArray* answers;
@property(nonatomic) int correctAnswer;              

-(id) initWithQuestion:(NSString*)question       
                answer:(NSString*)answer         
          wrongAnswer1:(NSString*)wrongAnswer1   
          wrongAnswer2:(NSString*)wrongAnswer2;  

-(void) recordAnswer:(int)answerNum;             


-(CardResult*)cardResultInGame:(GameResult*)gameResult
                   withContext:(NSManagedObjectContext*) context;
@end

