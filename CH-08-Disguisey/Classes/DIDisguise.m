//
//  Disguise.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import "DIDisguise.h"


@implementation DIDisguise



@synthesize elements;
@synthesize lastChosenImage;


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


-(void)removeElement:(DIDisguiseElement*)el
{
    [self.elements removeObject:el];
}


-(DIDisguiseElement*)getElementAtPoint:(CGPoint)pt 
                           withImage:(UIImage*)image
{
    for (DIDisguiseElement *d in self.elements) {
        if (CGPointEqualToPoint(pt, d.point) && image == d.image) {
            return d;
        }
    }
    NSAssert(false, @"This should never happen"); 
    return nil;
}


-(UIImage*) overlayDisguisesOnFace:(UIImage *)face
{
    UIImage *newFace = face;
    for (DIDisguiseElement *d in self.elements) {
        newFace = [d overlayOnFace:newFace];
    }
    return newFace;
}

@end
