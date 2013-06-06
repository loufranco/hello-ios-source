//
//  FCCardViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

/*

@interface FCCardViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel* cardLabel;
@property (nonatomic, strong) IBOutlet UIButton* answer1Button;
@property (nonatomic, strong) IBOutlet UIButton* answer2Button;
@property (nonatomic, strong) IBOutlet UIButton* answer3Button;
 
-(void) nextCard;
-(IBAction)answerButtonTouched:(id)sender;

*/


#import <UIKit/UIKit.h>
#import "FCGame.h"
#import "FCCard.h"
#import "FCResultViewController.h"

@interface FCCardViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel* cardLabel;
@property (nonatomic, strong) IBOutlet UIButton* answer1Button;
@property (nonatomic, strong) IBOutlet UIButton* answer2Button;
@property (nonatomic, strong) IBOutlet UIButton* answer3Button;

@property (nonatomic, strong) FCResultViewController* resultsVC;

@property (nonatomic, strong) FCGame* game;
@property (nonatomic, strong) FCCard* currentCard; 

-(id) initWithGame:(FCGame*)g;
-(void) nextCard;
-(IBAction) answerButtonTouched:(id)sender;

@end

