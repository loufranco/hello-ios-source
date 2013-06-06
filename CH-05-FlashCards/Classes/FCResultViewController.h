//
//  FCResultViewController.h
//  FlashCards
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

/*


@interface FCResultViewController : UIViewController {

}

-(IBAction)startAgain:(id)sender;


*/



#import <UIKit/UIKit.h>
#import "Models/FCGame.h"

@interface FCResultViewController : UIViewController {
	UILabel* numRightLabel;
	UILabel* numWrongLabel;
	UIButton* startAgainButton;
	FCGame* game;
}

@property(nonatomic, strong) IBOutlet UILabel* numRightLabel;
@property(nonatomic, strong) IBOutlet UILabel* numWrongLabel;
@property(nonatomic, strong) IBOutlet UIButton* startAgainButton;

@property(nonatomic, strong) FCGame* game;

-(id) initWithGame:(FCGame*)g;
-(IBAction)startAgain:(id)sender;

@end



