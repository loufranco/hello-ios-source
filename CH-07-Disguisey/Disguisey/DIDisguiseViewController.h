//
//  DISecondViewController.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIDisguise.h"
@interface DIDisguiseViewController : UIViewController


-(IBAction)disguiseElementChosen:(id)sender;


@property (strong, nonatomic) DIDisguise* disguise;

@end
