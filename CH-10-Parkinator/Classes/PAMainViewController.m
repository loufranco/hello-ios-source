//
//  MainViewController.m
//  Parkinator
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//


#import "PAMainViewController.h"


#import "PAHelpViewController.h"






@implementation PAMainViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
    self.freeSpaces = [[NSMutableArray alloc] init];

}


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



- (IBAction)showHelp:(id)sender
{
    PAHelpViewController *help = 
      [[PAHelpViewController alloc]
         initWithNibName:@"PAHelpViewController" 
         bundle:nil];
    [self presentViewController:help animated:YES completion:nil];
}



- (IBAction)tweetLocation:(id)sender {
    if([SLComposeViewController
        isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSString *tweetText =
        [NSString stringWithFormat:@"#Parkinator %F %F",
         self.lastLocation.latitude, 
         self.lastLocation.longitude];
        SLComposeViewController *tweetComposeViewController = 
        [SLComposeViewController
         composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetComposeViewController setInitialText:tweetText]; 
        [self presentViewController:tweetComposeViewController 
                           animated:YES completion:nil];
        tweetComposeViewController.completionHandler = 
        ^(SLComposeViewControllerResult result)  {
            [self dismissViewControllerAnimated:YES completion:nil];
        };
    }
}


/*

http://search.twitter.com/search.json?q=
 Parkinator&amp;result_type=recent&amp;rpp=10

*/



- (IBAction)searchTwitter:(id)sender {
    SLRequest *twRequest =
    [SLRequest requestForServiceType:SLServiceTypeTwitter
        requestMethod:SLRequestMethodGET
            URL:[NSURL URLWithString:
                 @"http://search.twitter.com/search.json?"
                 "q=%23Parkinator&result_type=recent&rpp=10"]
                          parameters:nil];
    
	[twRequest performRequestWithHandler: 
     ^(NSData *responseData, NSHTTPURLResponse *response,
       NSError *error) {
         
         if ([response statusCode] == 200) { 
             [self.mapView removeAnnotations:self.freeSpaces];
             [self.freeSpaces removeAllObjects];  
             NSError *jsonError = nil;
             NSDictionary *results =  
             [NSJSONSerialization
              JSONObjectWithData:responseData
              options:0
              error:&jsonError];
             NSArray *tweets =  [results valueForKey:@"results"];
             for(id tweet in tweets) {
                 NSString *tweetText = [tweet valueForKey:@"text"];
                 [self parseTweet:tweetText]; 
             }
             [self performSelectorOnMainThread:@selector(updatePins)
                                    withObject:nil
                                 waitUntilDone:NO];
         }
     }];

    
}


- (void) updatePins {
    [self.mapView addAnnotations:self.freeSpaces];
}

/*

[self performSelectorOnMainThread:@selector(updatePins) 
                       withObject:nil 
                    waitUntilDone:NO];

*/


- (void)parseTweet:(NSString*) tweet {
    NSArray *parsedText =  
      [tweet componentsSeparatedByString:@" "]; 
    if([parsedText count] == 3) {   
        if([@"#Parkinator" isEqual: 
            [parsedText objectAtIndex:0]]) {
            double latitude =  
              [[parsedText objectAtIndex:1] doubleValue];
            double longitude = 
              [[parsedText objectAtIndex:2] doubleValue];
            if((latitude != 0) && (longitude != 0)) { 
                CLLocationCoordinate2D freeSpacelocation;
                freeSpacelocation.latitude = latitude;
                freeSpacelocation.longitude = longitude;
                PAParkingSpot *freeSpace = 
                  [[PAParkingSpot alloc] 
                     initWithSpotCoordinate:freeSpacelocation];
                [self.freeSpaces addObject:freeSpace]; 
            }
        }
    }
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
    } else if ([self.freeSpaces containsObject:annotation]) {
        pin = (MKPinAnnotationView*) 
          [self.mapView 
             dequeueReusableAnnotationViewWithIdentifier:@"freeSpot"];
        if(pin == nil) {
            pin=[[MKPinAnnotationView alloc] 
                 initWithAnnotation:annotation 
                 reuseIdentifier:@"freeSpot"];
            pin.pinColor = MKPinAnnotationColorRed; 
        }
        [pin setAnimatesDrop:YES]; 
        
    }
    return pin;
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [self setCarPhoto:nil];
    [self setMapView:nil];
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

