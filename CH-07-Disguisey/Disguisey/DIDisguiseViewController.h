//
//  DISecondViewController.h
//  Disguisey
//
//  Created by Louis Franco and Eitan Mendelowitz.
//  Copyright (c) 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <UIKit/UIKit.h>
#import "DIDisguise.h"
@interface DIDisguiseViewController : UIViewController


-(IBAction)disguiseElementChosen:(id)sender;


@property (strong, nonatomic) DIDisguise* disguise;

@end
