//
//  Disguise.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import "Disguise.h"


@implementation Disguise



@synthesize elements;
@synthesize lastChosenImage;


-(id)init
{
    if (self = [super init]) {
        self.elements = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc
{
    self.elements = nil;
    self.lastChosenImage = nil;
    [super dealloc];
}

-(void)clear
{
    [self.elements removeAllObjects];
}

-(bool)wasElementChosen
{
    return self.lastChosenImage != nil;
}





-(DisguiseElement*)placeChosenElement:(CGPoint)point
{
    if ([self wasElementChosen]) {
        DisguiseElement* el = [[[DisguiseElement alloc] 
            initWithImage:self.lastChosenImage atPoint:point]
            autorelease];
        [self.elements addObject:el];
		
        self.lastChosenImage = nil;
        return el;
    }
    return nil;
}



@end
