//
//  FacialHairViewController.h
//  Disguisey
//
//  Created by Lou Franco and Eitan Mendelowitz.
//  Copyright 2013 Lou Franco and Eitan Mendelowitz. See repository license.
//

#import <UIKit/UIKit.h>
#import "Disguise.h"

/*

 
@interface DisguiseViewController : UIViewController {
	
}

-(IBAction)disguiseElementChosen:(id)sender; 

@end

*/


@interface DisguiseViewController : UIViewController {
	Disguise* disguise;

}

-(IBAction)disguiseElementChosen:(id)sender;

@property(retain, nonatomic) Disguise* disguise;

@end
