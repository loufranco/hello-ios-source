//
//  MainViewController.h
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//


#import "PAFlipsideViewController.h"
#import <MapKit/MapKit.h>
#import "PAParkingSpot.h"

#import <Social/Social.h>


@interface PAMainViewController : UIViewController 
    <FlipsideViewControllerDelegate, MKMapViewDelegate> 


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *carPhoto;
@property(nonatomic) CLLocationCoordinate2D lastLocation;
@property(nonatomic, strong) PAParkingSpot *spot;


- (IBAction)showInfo:(id)sender;


//- (IBAction)showHelp:(id)sender;




- (IBAction)tweetLocation:(id)sender;




@property(nonatomic, strong) NSMutableArray *freeSpaces;
- (IBAction)searchTwitter:(id)sender;
- (void) updatePins;
- (void) parseTweet:(NSString*) tweet;



@end

