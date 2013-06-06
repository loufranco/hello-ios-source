//
//  DIDisguise.m
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DIDisguise.h"


@implementation DIDisguise


@synthesize elements = _elements;
@synthesize lastChosenImage = _lastChosenImage;

-(id)init
{
    if (self = [super init]) {
        self.elements = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)clear
{
    [self.elements removeAllObjects];
}

-(bool)wasElementChosen
{
    return self.lastChosenImage != nil;
}


-(DIDisguiseElement*)placeChosenElement:(CGPoint)point
{
    if ([self wasElementChosen]) {
        DIDisguiseElement* el = [[DIDisguiseElement alloc] 
            initWithImage:self.lastChosenImage atPoint:point];
        [self.elements addObject:el];
		
        self.lastChosenImage = nil;
        return el;
    }
    return nil;
}

@end
