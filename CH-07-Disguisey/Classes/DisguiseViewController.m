//
//  FacialHairViewController.m
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//



 #import "DisguiseyAppDelegate.h"



#import "DisguiseViewController.h"
#import "FaceViewController.h"

@implementation DisguiseViewController

@synthesize disguise;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
/*
 
 
-(IBAction)disguiseElementChosen:(id)sender
{
   DisguiseyAppDelegate* delegate = 
      [[UIApplication sharedApplication] delegate];
   delegate.tabBar.selectedIndex = 0;
}
 
*/
-(IBAction)disguiseElementChosen:(id)sender
{
	DisguiseyAppDelegate* delegate = 
        [[UIApplication sharedApplication] delegate];
	self.disguise.lastChosenImage = ((UIButton*)sender).currentImage;
	
	delegate.tabBar.selectedIndex = 0;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.disguise = nil;
    [super dealloc];
}


@end
