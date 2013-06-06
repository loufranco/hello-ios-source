//
//  FCViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. All rights reserved.
//


/* first version

 
#import <UIKit/UIKit.h> 

@interface FCViewController : UIViewController {
 
								
 
}								
								
 
@end							


*/
/* 


@interface FCViewController : UIViewController {

}								
									
-(IBAction) showStates:(id)sender;
-(IBAction) showCapitals:(id)sender;

@end								


*/

/*

@property (weak, nonatomic) IBOutlet UIButton *showStatesButton;
@property (weak, nonatomic) IBOutlet UIButton *showCapitalsButton;

*/



#import <UIKit/UIKit.h>
#import "Models/FCGame.h"                
#import "Models/FCAnswerKey.h"
#import "FCCardViewController.h"

@interface FCViewController : UIViewController {
    FCCardViewController *cardVC;
	
}

@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *showStatesButton;
@property (weak, nonatomic) IBOutlet UIButton *showCapitalsButton;


@property (nonatomic, strong) FCCardViewController *cardVC;

-(IBAction) showStates:(id)sender;
-(IBAction) showCapitals:(id)sender;

@end								


