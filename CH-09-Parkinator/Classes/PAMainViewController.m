//
//  MainViewController.m
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//


#import "PAMainViewController.h"

@implementation PAMainViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}
*/

/* This is what it looks like before we make the annotation
 

- (void)flipsideViewControllerDidFinish:
     (FlipsideViewController *)controller {
 
    self.carImage.image = controller.carPhoto.image;
 
    [self dismissModalViewControllerAnimated:YES];
}

 
 
 
 */



- (void)flipsideViewControllerDidFinish:
      (PAFlipsideViewController *)controller {
    
    self.carPhoto.image = controller.carPhoto.image;
    
    self.spot = [[PAParkingSpot alloc] 
                  initWithSpotCoordinate:self.lastLocation];
    [self.mapView addAnnotation:self.spot]; 
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)showInfo:(id)sender {    
	PAFlipsideViewController *controller = [[PAFlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];	
}


- (void) mapView:(MKMapView *)mapView 
    didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    MKCoordinateSpan span = MKCoordinateSpanMake(.02f, .02f); 
    
    self.lastLocation = userLocation.location.coordinate; 
    MKCoordinateRegion region = 
        MKCoordinateRegionMake(self.lastLocation, span);

    [self.mapView setRegion:region animated:YES];
     
}



-(MKAnnotationView*)mapView:(MKMapView *)mView 
          viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pin = nil;
    if (annotation == self.spot) {
        pin = (MKPinAnnotationView*)[self.mapView 
           dequeueReusableAnnotationViewWithIdentifier:@"spot"];
        
        if (pin == nil) {
            pin = [[MKPinAnnotationView alloc]
                    initWithAnnotation:self.spot 
                    reuseIdentifier:@"spot"];
            pin.pinColor = MKPinAnnotationColorGreen;
        }
    }
    return pin;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


@end

