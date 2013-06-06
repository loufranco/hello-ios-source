//
//  CardResult.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <CoreData/CoreData.h>

@class GameResult;

@interface CardResult :  NSManagedObject  
{
}

@property (nonatomic, strong) NSString * cardName;
@property (nonatomic, strong) NSNumber * wasCorrect;
@property (nonatomic, strong) GameResult * gameResults;

@end



