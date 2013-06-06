//
//  AnswerKey.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "FCAnswerKey.h"

@implementation FCAnswerKey

-(NSMutableArray*) allocStateCards
{
    NSMutableArray *cards = [[NSMutableArray alloc] initWithObjects:
     [[FCCard alloc] 
      initWithQuestion:@"Alabama"
      answer: @"Montgomery"
      wrongAnswer1:@"Birmingham"
      wrongAnswer2:@"Mobile"],
     [[FCCard alloc] 
      initWithQuestion:@"New York"
      answer: @"Albany"
      wrongAnswer1:@"New York City"
      wrongAnswer2:@"Buffalo"],
     [[FCCard alloc] 
      initWithQuestion:@"New Jersey"
      answer: @"Trenton"
      wrongAnswer1:@"Camden"
      wrongAnswer2:@"Newark"], 
      nil ];
	
    return cards;  
}

-(NSMutableArray*) allocCapitalCards
{
    NSMutableArray *cards = [[NSMutableArray alloc] initWithObjects:
     [[FCCard alloc] 
      initWithQuestion:@"Montgomery"
      answer: @"Alabama"
      wrongAnswer1:@"Mississippi"
      wrongAnswer2:@"Tennessee"],
     [[FCCard alloc] 
      initWithQuestion:@"Albany"
      answer: @"New York"
      wrongAnswer1:@"New Jersey"
      wrongAnswer2:@"Pennsylvania"],
     [[FCCard alloc] 
      initWithQuestion:@"Trenton"
      answer: @"New Jersey"
      wrongAnswer1:@"New York"
      wrongAnswer2:@"Connecticut"], 
     nil ];
    
    return cards;
}


@end
