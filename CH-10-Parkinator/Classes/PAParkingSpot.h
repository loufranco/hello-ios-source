//
//  ParkingSpot.h
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PAParkingSpot : NSObject<MKAnnotation>

-(id)initWithSpotCoordinate:(CLLocationCoordinate2D)spot;

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
