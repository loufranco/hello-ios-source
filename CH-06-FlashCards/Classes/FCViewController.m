//
//  FlashCardsViewController.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. All rights reserved.
//

/*

 
#import "FlashCardsViewController.h"

@implementation FlashCardsViewController

@end


*/ 

#import "FCViewController.h"
#import "FCAppDelegate.h"
#import "FCGameHistoryViewController.h"


#import <QuartzCore/QuartzCore.h>

@implementation FCViewController

@synthesize titleLabel;
@synthesize showStatesBtn;
@synthesize showCapitalsBtn;
@synthesize showHistoryBtn;

@synthesize cardVC;
@synthesize historyVC;


-(IBAction)showCards:(NSMutableArray*)cards {
    FCGame* game = [[FCGame alloc] initWithCards:cards];
    self.cardVC = [[FCCardViewController alloc]
                          initWithGame:game];

    self.cardVC.view.frame = CGRectMake(0, 20, 320, 460);
    [self.view.window addSubview:cardVC.view];

    FCAppDelegate* delegate = 
        [[UIApplication sharedApplication] delegate];
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



-(IBAction) showHistory:(id)sender
{
    FCGameHistoryViewController* ghVC =
        [[FCGameHistoryViewController alloc] 
            initWithNibName:@"FCGameHistoryViewController" bundle:nil];
    
    self.historyVC = [[UINavigationController alloc] 
                       initWithRootViewController: ghVC];
    
    self.historyVC.view.frame = CGRectMake(0, 20, 320, 460);
    [self.view.window addSubview:historyVC.view];
    
    FCAppDelegate* delegate = 
        [[UIApplication sharedApplication] delegate];
        [delegate pushView];
}








-(void) animateViewEntrance:(UIView*)v 
   startY:(int)startY delay:(NSTimeInterval)delay
{
    CGRect frame = v.frame;
    int endY = frame.origin.y;  
    
    frame.origin.y = startY;    
    v.frame = frame;

    [UIView beginAnimations:@"pushSubview" context:nil];
    [UIView setAnimationDuration: 0.25];
    [UIView setAnimationDelay: delay];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    frame.origin.y = endY;     
    v.frame = frame;
    
    [UIView commitAnimations];
}






-(void) animateViewLoad
{
    [self animateViewEntrance:self.showStatesBtn 
        startY:self.view.frame.size.height delay:0];
    [self animateViewEntrance:self.showCapitalsBtn 
        startY:self.view.frame.size.height delay:0];
    [self animateViewEntrance:self.showHistoryBtn
        startY:self.view.frame.size.height+75 delay:0];
    [self animateViewEntrance:self.titleLabel 
        startY:-titleLabel.frame.size.height delay:0];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    


    FCAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    [delegate setupButtonAsImage:self.showStatesBtn 
                     normalImage:@"btn-normal.png" 
                   selectedImage:@"btn-selected.png" 
                         leftCap:15 topCap:25];
    [delegate setupButtonAsImage:self.showCapitalsBtn 
                     normalImage:@"btn-normal.png" 
                   selectedImage:@"btn-selected.png" 
                         leftCap:15 topCap:25];    
    
    [delegate setupButtonAsImage:self.showHistoryBtn
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

