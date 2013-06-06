//
//  MainViewController.h
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//


#import "PAFlipsideViewController.h"


#import <MapKit/MapKit.h>


#import "PAParkingSpot.h"


@interface PAMainViewController : UIViewController 
    <FlipsideViewControllerDelegate, MKMapViewDelegate> 




@property(nonatomic, strong) IBOutlet MKMapView *mapView;


@property(nonatomic, strong) IBOutlet UIImageView *carPhoto;


    
@property(nonatomic) CLLocationCoordinate2D lastLocation; 


@property(nonatomic, strong) PAParkingSpot *spot;
- (IBAction)showInfo:(id)sender;

@end

