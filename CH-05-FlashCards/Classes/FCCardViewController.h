//
//  FCCardViewController
//  FlashCards
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

/*


@interface FCCardViewController : UIViewController {
}
 
-(void) nextCard;
-(IBAction)answerButtonTouched:(id)sender;


*/



#import <UIKit/UIKit.h>
#import "Models/FCGame.h"
#import "Models/FCCard.h"
#import "FCResultViewController.h"

@interface FCCardViewController : UIViewController {
    UILabel* cardLabel;
    UIButton* answer1Button;
    UIButton* answer2Button;
    UIButton* answer3Button;
	
    FCGame* game;
    FCCard* currentCard;
    FCResultViewController* resultsVC;
}

@property (nonatomic, strong) IBOutlet UILabel* cardLabel;
@property (nonatomic, strong) IBOutlet UIButton* answer1Button;
@property (nonatomic, strong) IBOutlet UIButton* answer2Button;
@property (nonatomic, strong) IBOutlet UIButton* answer3Button;

@property (nonatomic, strong) FCGame* game;
@property (nonatomic, strong) FCCard* currentCard; 

@property (nonatomic, strong) FCResultViewController* resultsVC;

-(id) initWithGame:(FCGame*)g;
-(void) nextCard;
-(IBAction) answerButtonTouched:(id)sender;

@end


