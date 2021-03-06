//
//  DISecondViewController.m
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "DIDisguiseViewController.h"
#import "DIAppDelegate.h"

@implementation DIDisguiseViewController
@synthesize disguise = _disguise;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


-(IBAction)disguiseElementChosen:(id)sender
{
	self.disguise.lastChosenImage = ((UIButton*)sender).currentImage;
	
    self.tabBarController.selectedIndex = 0;
}



#pragma mark - View lifecycle
  
- (void)viewDidLoad
{
    [super viewDidLoad];
    DIAppDelegate* app = (DIAppDelegate*)
        [[UIApplication sharedApplication] delegate];
    self.disguise = app.disguise;
}  

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
