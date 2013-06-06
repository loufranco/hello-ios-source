//
//  ParkingSpot.m
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import "PAParkingSpot.h"

@implementation PAParkingSpot

@synthesize coordinate = _coordinate;

-(id)initWithSpotCoordinate:(CLLocationCoordinate2D)spot
{
    self = [super init];
    if (self != nil) {
        self.coordinate = spot;
    }
    return self;
}

@end
