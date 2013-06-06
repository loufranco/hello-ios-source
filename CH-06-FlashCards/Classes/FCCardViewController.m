//
//  CardViewController.m
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

/*


-(void) nextCard {
}
  
-(IBAction)answerButtonTouched:(id)sender {
}
 

 
 
 
*/


#import "FCCardViewController.h"
#import "FCAppDelegate.h"


@implementation FCCardViewController



@synthesize cardLabel;
@synthesize answer1Button;
@synthesize answer2Button;
@synthesize answer3Button;

@synthesize game;
@synthesize currentCard;
@synthesize resultsVC;





-(id) initWithGame:(FCGame*)g {
    if (self = [self initWithNibName:@"FCCardViewController"  
                              bundle:[NSBundle mainBundle]]) {
        self.game = g;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];

    FCAppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    [delegate setupButtonAsImage:self.answer1Button normalImage:@"btn-normal.png" selectedImage:@"btn-selected.png" leftCap:15 topCap:25];    
    [delegate setupButtonAsImage:self.answer2Button normalImage:@"btn-normal.png" selectedImage:@"btn-selected.png" leftCap:15 topCap:25];    
    [delegate setupButtonAsImage:self.answer3Button normalImage:@"btn-normal.png" selectedImage:@"btn-selected.png" leftCap:15 topCap:25];    
    
    [self nextCard]; 
}







-(void) nextCard {
    if ([game hasMoreCards]) {
        self.currentCard = [game getNextCard];
        
        self.cardLabel.text = self.currentCard.cardText; 
        [self.answer1Button 
            setTitle:[self.currentCard.answers objectAtIndex:0] 
            forState:UIControlStateNormal];
        [self.answer2Button 
            setTitle:[self.currentCard.answers objectAtIndex:1] 
            forState:UIControlStateNormal];
        [self.answer3Button 
            setTitle:[self.currentCard.answers objectAtIndex:2] 
            forState:UIControlStateNormal];
        
    } else {
        self.resultsVC = [[FCResultViewController alloc] 
                            initWithGame:self.game];
        
        self.resultsVC.view.frame = CGRectMake(0, 20, 320, 460);
        [self.view.window addSubview:self.resultsVC.view]; 
        
        [self.view removeFromSuperview];                   
        
    }
}





-(IBAction)answerButtonTouched:(id)sender {
    if (sender == answer1Button) {    
        [self.currentCard recordAnswer:0];
    }
    else if (sender == answer2Button) {
        [self.currentCard recordAnswer:1];
    }
    else if (sender == answer3Button) {
        [self.currentCard recordAnswer:2];
    }
    [self nextCard];  
    

    
FCAppDelegate* delegate = 
    [[UIApplication sharedApplication] delegate];
[delegate flipView];
    

    
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.


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
