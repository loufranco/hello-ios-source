//
//  ParkingSpot.m
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//


#import "PAParkingSpot.h"

@implementation PAParkingSpot

-(id)initWithSpotCoordinate:(CLLocationCoordinate2D)spot
{
    self = [super init];
    if (self != nil) {
        self.coordinate = spot;
    }
    return self;
}

@end

