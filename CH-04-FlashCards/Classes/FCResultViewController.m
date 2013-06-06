//
//  FCResultViewController.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import "FCResultViewController.h"

/*

 
-(IBAction)startAgain:(id)sender {
}

 
*/

@implementation FCResultViewController



-(id) initWithGame:(FCGame*)g {
    if (self = [self 
            initWithNibName:@"FCResultViewController" 
                     bundle:[NSBundle mainBundle]]) {
        self.game = g;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numRightLabel.text =  
        [NSString stringWithFormat:@"%d Right", 
            [self.game getNumRight]];
    self.numWrongLabel.text = 
        [NSString stringWithFormat:@"%d Wrong", 
            [self.game getNumWrong]];
}

-(IBAction)startAgain:(id)sender {
    [self.view removeFromSuperview];  
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
