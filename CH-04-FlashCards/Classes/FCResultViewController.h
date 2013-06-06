//
//  FCResultViewController.h
//  FlashCards
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. All rights reserved.
//

/*


@interface FCResultViewController : UIViewController {
    UILabel* numRightLabel;
    UILabel* numWrongLabel;
}

@property(nonatomic, strong) IBOutlet UILabel* numRightLabel;
@property(nonatomic, strong) IBOutlet UILabel* numWrongLabel;
 
-(IBAction)startAgain:(id)sender;


*/



#import <UIKit/UIKit.h>
#import "FCGame.h"

@interface FCResultViewController : UIViewController

@property(nonatomic, strong) IBOutlet UILabel* numRightLabel;
@property(nonatomic, strong) IBOutlet UILabel* numWrongLabel;
@property(nonatomic, strong) FCGame* game;

-(id) initWithGame:(FCGame*)g;
-(IBAction)startAgain:(id)sender;

@end



