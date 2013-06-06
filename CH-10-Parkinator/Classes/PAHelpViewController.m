//
//  PAHelpViewController.m
//  Parkinator
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PAHelpViewController.h"

@implementation PAHelpViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)onDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*

- (void)viewDidLoad
{
     [self.helpView
        loadRequest:[NSURLRequest 
           requestWithURL:[NSURL URLWithString:
              @"http://www.manning.com/"]]];
}

 */

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *helpPath = 
      [[NSBundle mainBundle] 
        pathForResource:@"help" ofType:@"html"];     
    NSURL *url = 
      [NSURL fileURLWithPath:helpPath];
    
    [self.helpView 
        loadRequest:[NSURLRequest 
          requestWithURL:url]];
}


- (void)viewDidUnload
{
    [self setHelpView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
