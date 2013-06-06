//
//  FlashCardsViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright Lou Franco and Eitan Mendelowitz 2013. See repository license.
//


#import <UIKit/UIKit.h>
#import "Models/FCGame.h"                
#import "Models/FCAnswerKey.h"
#import "FCCardViewController.h"

@interface FCViewController : UIViewController {
    FCCardViewController *cardVC;
    UINavigationController *historyVC;
    
    UILabel* titleLabel;
    UIButton* showStatesBtn;
    UIButton* showCapitalsBtn;
    UIButton* showHistoryBtn;
}                                

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet UIButton* showStatesBtn;
@property (nonatomic, strong) IBOutlet UIButton* showCapitalsBtn;    

@property (nonatomic, strong) IBOutlet UIButton* showHistoryBtn;    

@property (nonatomic, strong) FCCardViewController* cardVC;
@property (nonatomic, strong) UINavigationController* historyVC;

-(IBAction) showStates:(id)sender;
-(IBAction) showCapitals:(id)sender;

-(IBAction) showHistory:(id)sender;

@end                                


