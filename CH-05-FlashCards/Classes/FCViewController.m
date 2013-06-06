//
//  FCViewController.m
//  FlashCards
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

/*

 
#import "FCViewController.h"

@implementation FCViewController

@end


*/ 

#import "FCViewController.h"
#import "FCAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation FCViewController


@synthesize cardVC;


-(IBAction)showCards:(NSMutableArray*)cards {
    FCGame* game = [[FCGame alloc] initWithCards:cards];
    self.cardVC = [[FCCardViewController alloc]
                          initWithGame:game];

	self.cardVC.view.frame = CGRectMake(0, 20, 320, 460);
	[self.view.window addSubview:cardVC.view];

	
	
FCAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
[delegate pushView];

	
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


-(void) animateViewEntrance:(UIView*)v 
   startY:(int)startY delay:(NSTimeInterval)delay
{
    CGRect frame = v.frame;
    CGFloat endY = frame.origin.y;  
	
    frame.origin.y = startY;    
    v.frame = frame;

    [UIView animateWithDuration:0.25 delay:delay 
        options:UIViewAnimationCurveEaseInOut 
        animations:^{
            v.frame = CGRectMake(
                frame.origin.x, endY,     
                frame.size.width, frame.size.height
            );
        } completion:nil];
}




-(void) animateViewLoad
{
    [self animateViewEntrance:self.showStatesButton 
        startY:self.view.frame.size.height delay:0];
    [self animateViewEntrance:self.showCapitalsButton 
        startY:self.view.frame.size.height  delay:0];
    [self animateViewEntrance:self.titleLabel 
        startY:-self.titleLabel.frame.size.height delay:0];
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	

    FCAppDelegate* delegate = [[UIApplication 
                                        sharedApplication] delegate];
    [delegate setupButtonAsImage:self.showStatesButton 
                     normalImage:@"btn-normal.png" 
                   selectedImage:@"btn-selected.png" 
                         leftCap:15 topCap:25];
    [delegate setupButtonAsImage:self.showCapitalsButton 
                     normalImage:@"btn-normal.png" 
                   selectedImage:@"btn-selected.png" 
                         leftCap:15 topCap:25];	



[self animateViewLoad];

	

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

