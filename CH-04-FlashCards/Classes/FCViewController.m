//
//  FCCardViewController.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. See repository license.
//

/*

 
#import "FCCardViewController.h"

@implementation FCCardViewController

@end


*/ 

#import "FCViewController.h"
#import "FCGame.h"

@implementation FCViewController


/* empty version

-(IBAction)showStates:(id)sender {
}

-(IBAction)showCapitals:(id)sender {
}

*/


-(IBAction)showCards:(NSMutableArray*)cards {
    FCGame* game = [[FCGame alloc] initWithCards:cards];
    
    self.cardVC = [[FCCardViewController alloc]
                          initWithGame:game];
    [self.view.window addSubview:self.cardVC.view];
}



-(IBAction)showStates:(id)sender {
    FCAnswerKey* key = [[FCAnswerKey alloc] init];
    NSMutableArray *cards = [key allocStateCards];
    [self showCards:cards];
}

-(IBAction)showCapitals:(id)sender {
    FCAnswerKey* key = [[FCAnswerKey alloc] init];
    NSMutableArray *cards = [key allocCapitalCards];
    [self showCards:cards];
}






/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



@end
