//
//  FCCardViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. See repository license.
//


/* first version

#import <UIKit/UIKit.h> 

@interface FCViewController : UIViewController 
								
								
@end							

*/
/* 

@interface FCViewController : UIViewController
									
-(IBAction) showStates:(id)sender;
-(IBAction) showCapitals:(id)sender;

@end								

*/

#import <UIKit/UIKit.h>
#import "FCGame.h"                
#import "FCAnswerKey.h"
#import "FCCardViewController.h"

@interface FCViewController : UIViewController
@property (nonatomic, strong) FCCardViewController *cardVC;
-(IBAction)showCards:(NSMutableArray*)cards;
-(IBAction) showStates:(id)sender;
-(IBAction) showCapitals:(id)sender;

@end								

