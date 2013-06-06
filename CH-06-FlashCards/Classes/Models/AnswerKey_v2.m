//
//  AnswerKey.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//



#import "AnswerKey.h"

@implementation AnswerKey
-(NSMutableArray*) allocCardsFromInfo:(NSString*[][4])cardInfo 
                                 rows:(int)rows {
	NSLog(@"start allocCardsFromInfo");
    NSMutableArray *cards = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < rows; ++i) {                       
        [cards addObject: [[[Card alloc] 
            initWithQuestion:cardInfo[i][0] 
                      answer:cardInfo[i][1]
                wrongAnswer1:cardInfo[i][2]
                wrongAnswer2:cardInfo[i][3]] autorelease]];         
    }
    
	NSLog(@"end allocCardsFromInfo");   
 
	UIAlertView* alert = [[UIAlertView alloc] 
		initWithTitle:@"Debug Alert"  
		message:[NSString 
		  stringWithFormat:@"allocCardsFromInfo completed"]   
		delegate:nil 
		cancelButtonTitle:@"Dismiss" 
		otherButtonTitles:nil];
   [alert show];
 
    return cards;
}

-(NSMutableArray*) allocStateCards
{
    NSString* stateCardInfo[][4] = {  
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alaska",     @"Juneau", @"Anchorage",    @"Wasilla"},
        {@"Arizona", @"Phoenix",    @"Tucson",        @"Flagstaff"},
        {@"Arkansas",   @"Little Rock",     @"Baton Rouge", @"Mephis"},
        {@"California",    @"Sacremento", @"Los Angelos",    @"Santa Clara"},
        {@"Colorado",    @"Denver", @"Boulder",    @"Vail"},
        {@"Connecticut", @"Hartford",    @"New Haven",        @"Milford"},
        {@"Delaware",   @"Dover",     @"Newark", @"Dupont"},
        {@"Florida",    @"Tallahassee", @"Miami",    @"Orlando"},
        {@"Georgia",    @"Atlanta", @"Mason",    @"Columbia"},
        {@"Hawaii", @"Honolulu",    @"Oahu",        @"Aloha"},
        {@"Idaho",   @"Boise",     @"Des Moines", @"Olympia"},
        {@"Illinois",    @"Springfield", @"Chicago",    @"Lincoln"},
        {@"Indiana",    @"Indianapolis", @"Pawnee",    @"Des Moines"},
        {@"Iowa", @"Des Moines",    @"Springfield",        @"Olympia"},
        {@"Kansas",   @"Lansing",     @"Frankfort", @"Kansas City"},
        {@"Kentucky",    @"Frankfort", @"Linclon",    @"Mobile"},
        {@"Louisiana",    @"Baton Rouge", @"Montpelier",    @"Des Moines"},
        {@"Maine", @"Augusta",    @"Camden",        @"Bangor"},
        {@"Maryland",    @"Annapolis", @"Baltimore",    @"Trenton"},
        {@"Massachusetts",   @"Boston",     @"Springfield", @"Foxboro"},
        {@"Michigan", @"Lansing",    @"Detroit",        @"Carson City"},
        {@"Mississippi",    @"Biloxi", @"Biloxi",    @"Biloxi"},
        {@"Missouri",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Minnesota",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Montana",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Nebraska", @"Trenton",    @"Camden",        @"Newark"},
        {@"Nevada",   @"Albany",     @"New York City", @"Buffalo"},
        {@"New Hampshire",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New Mexico",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"North Carolina",   @"Albany",     @"New York City", @"Buffalo"},
        {@"North Dakota", @"Trenton",    @"Camden",        @"Newark"},
        {@"Ohio",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Oklahoma",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Oregon",    @"Montgomery", @"Birmingham",    @"Mobile"},        
        {@"Pennsylvania", @"Trenton",    @"Camden",        @"Newark"},
        {@"Rhode Island",   @"Albany",     @"New York City", @"Buffalo"},
        {@"South Carolina",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"South Dakota", @"Trenton",    @"Camden",        @"Newark"},
        {@"Tennessee",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Texas",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Utah",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Vermont", @"Trenton",    @"Camden",        @"Newark"},
        {@"Virginia",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Washington",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"West Virginia",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Wisconson", @"Trenton",    @"Camden",        @"Newark"},
        {@"Wyoming",   @"Albany",     @"New York City", @"Buffalo"},
        
    };
    
    return [self allocCardsFromInfo:stateCardInfo rows:50];  
}

-(NSMutableArray*) allocCapitalCards
{
    NSString* capitalCardInfo[][4] = {
        {@"Montgomery", @"Alabama",    @"Mississippi", @"Tennessee"},
        {@"Albany",     @"New York",   @"New Jersey",  @"New Hampshire"},
        {@"Trenton",    @"New Jersey", @"New York",    @"New Mexico"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"Alabama",    @"Montgomery", @"Birmingham",    @"Mobile"},
        {@"New Jersey", @"Trenton",    @"Camden",        @"Newark"},
        {@"New York",   @"Albany",     @"New York City", @"Buffalo"},
    };
    
    return [self allocCardsFromInfo:capitalCardInfo rows:50];
}


@end


