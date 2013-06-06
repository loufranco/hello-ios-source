//
//  GameResult.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import <CoreData/CoreData.h>

@class CardResult;

@interface GameResult :  NSManagedObject  
{
}

@property (nonatomic, strong) NSNumber * gameLength;
@property (nonatomic, strong) NSDate * gameDate;
@property (nonatomic, strong) NSSet* cardResults;

@end


@interface GameResult (CoreDataGeneratedAccessors)
- (void)addCardResultsObject:(CardResult *)value;
- (void)removeCardResultsObject:(CardResult *)value;
- (void)addCardResults:(NSSet *)value;
- (void)removeCardResults:(NSSet *)value;

@end

