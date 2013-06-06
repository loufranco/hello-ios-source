//
//  FacialHairViewController.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <UIKit/UIKit.h>
#import "DIDisguise.h"



@interface DIDisguiseViewController : UIViewController {
    DIDisguise* disguise;

}

-(IBAction)disguiseElementChosen:(id)sender;

@property(strong, nonatomic) DIDisguise* disguise;

@end
