//
//  FlashCardsResultViewController.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

#import "FCResultViewController.h"
#import "FCAppDelegate.h"

/*


-(IBAction)startAgain:(id)sender {
}


*/

@implementation FCResultViewController



@synthesize numRightLabel;
@synthesize numWrongLabel;
@synthesize startAgainButton;
@synthesize game;

-(id) initWithGame:(FCGame*)g {
    if (self = [self 
            initWithNibName:@"FCResultViewController" 
                     bundle:[NSBundle mainBundle]]) {
        self.game = g;
        [self saveGame];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FCAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    [delegate setupButtonAsImage:self.startAgainButton normalImage:@"btn-normal.png" selectedImage:@"btn-selected.png" leftCap:15 topCap:25];    
    
    self.numRightLabel.text =  
        [NSString stringWithFormat:@"%d Right", 
            [self.game getNumRight]];
    self.numWrongLabel.text = 
        [NSString stringWithFormat:@"%d Wrong", 
            [self.game getNumWrong]];
}

-(IBAction)startAgain:(id)sender {
    [self.view removeFromSuperview];  
    FCAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    [delegate flipView];

}



-(void)saveGame {
    FCAppDelegate *appDelegate = 
        [[UIApplication sharedApplication] delegate];
    
    NSError* err = 
        [self.game save: appDelegate.dataContext];
    
    if (err != nil) {
        NSLog(@"Error in save: %@", 
              [err localizedDescription]);
    }
}








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
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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



@end
